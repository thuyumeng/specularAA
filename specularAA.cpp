/*
 * @Description: code for fun
 * @Author: yumeng
 * @Github: git@github.com:thuyumeng/
 * @Date: 2020-02-18 17:35:24
 * @LastEditors: yumeng
 * @LastEditTime: 2020-03-09 13:46:14
 */
#include <glad/gl.h>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stb/stb_image_write.h>
#define STB_IMAGE_IMPLEMENTATION
#include <stb/stb_image.h>
#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include <stb/stb_image_resize.h>

#include <graphics/shader.h>

#include <iostream>
#include <vector>

void framebuffer_size_callback(GLFWwindow * window, int width, int height);
void processInput(GLFWwindow * window);
void glfw_error_callback(int error, const char * description);

void generate_mipmap(
  unsigned int VAO,
  Shader & specular_shader,
  int mode = 0);
GLuint create_texture(const char * texture_path);
void get_resolution(int & width, int & height, int mode);
Shader generate_shader(int mode);

void set_uniform(int mode, Shader specular_shader);
void set_textures(int mode);
void bind_textures(int mode);

// 全局Shader方便重新加载编译
Shader * GLobal_Shader;
int SCR_WIDTH, SCR_HEIGHT;
bool Global_IsSaved;
int Global_mode;
GLuint texture_obj_ids[4] = {0, 0, 0, 0};

int main(int argc, char **argv) {
  int mode = atoi(argv[1]);
  Global_mode = mode;
  int width, height;
  get_resolution(width, height, mode);

  SCR_WIDTH = width;
  SCR_HEIGHT = height;
  Global_IsSaved = false;

  // 初始化glfw
  if (!glfwInit()) {
    std::cout << "GLFW INIT FAILED" << std::endl;
    return -1;
  }

  // OpenGL 3.2 以上 core profile模式
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
  glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  glfwSetErrorCallback(glfw_error_callback);

  // 创建glfw窗口
  GLFWwindow * window = glfwCreateWindow(
    SCR_WIDTH, SCR_HEIGHT, "SpecularAA", NULL, NULL);
  if (window == NULL) {
    std::cout << "Failed to create GLFW window" << std::endl;
    glfwTerminate();
    return -1;
  }
  glfwMakeContextCurrent(window);
  glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

  // glad: 加载OpenGL的函数
  if (!gladLoadGL(glfwGetProcAddress)) {
    std::cout << "Failed to initialize GLAD" << std::endl;
    return -1;
  }

  // VAO构造
  float vertices[] = {
    // positions
    1.0f, 1.0f, 0.0f,  1.0f, 0.0f, 0.0f,   1.0f, 1.0f,  // top right
    1.0f, -1.0f, 0.0f,  0.0f, 1.0f, 0.0f,   1.0f, 0.0f,  // bottom right
    -1.0f, -1.0f, 0.0f, 0.0f, 0.0f, 1.0f,   0.0f, 0.0f,  // bottom left
    -1.0f, 1.0f, 0.0f,  1.0f, 1.0f, 0.0f,   0.0f, 1.0f    // top left
  };

  unsigned int indices[] = {
    0, 1, 3,  // first triangle
    1, 2, 3   // second triangle
  };
  unsigned int VBO, VAO, EBO;
  glGenVertexArrays(1, &VAO);
  glGenBuffers(1, &VBO);
  glGenBuffers(1, &EBO);

  glBindVertexArray(VAO);

  glBindBuffer(GL_ARRAY_BUFFER, VBO);
  glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

  glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
  glBufferData(
    GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

  // position attribute
  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void *)0);
  glEnableVertexAttribArray(0);
  // color attribute
  glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(3 * sizeof(float)));
  glEnableVertexAttribArray(1);
  // texture coord attribute
  glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(6 * sizeof(float)));
  glEnableVertexAttribArray(2);

  // 加载贴图
  set_textures(mode);

  // Shader
  Shader specular_shader = generate_shader(mode);
  GLobal_Shader = &specular_shader;
  // 设置shader 的 texture unit
  
  // 生成mipmap 贴图
  generate_mipmap(
    VAO,
    specular_shader,
    mode);
  
  // 绘制窗口
  specular_shader.compile();
  set_uniform(mode, specular_shader);

  glBindFramebuffer(GL_FRAMEBUFFER, 0);

  // 渲染循环
  while (!glfwWindowShouldClose(window)) {
    // input
    processInput(window);
    int twidth, theight;
    glfwGetFramebufferSize(window, &twidth, &theight);
    glViewport(0, 0, twidth, theight);
    // 渲染
    glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);

    bind_textures(mode);

    // 渲染部分
    glBindVertexArray(VAO);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);

    // 存储预处理结果
    if (!Global_IsSaved) {
      Global_IsSaved = true;
    }

    // swapbuffer 和 poll IO events
    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  // 回收VAO
  glDeleteVertexArrays(1, &VAO);
  glDeleteBuffers(1, &VBO);
  glDeleteBuffers(1, &EBO);

  glfwTerminate();
  return 0;
}

void processInput(GLFWwindow * window) {
  if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
    glfwSetWindowShouldClose(window, true);
  // 摁下“K”键可以刷新shader
  if (glfwGetKey(window, GLFW_KEY_H) == GLFW_PRESS) {
    std::cout << "\n------------RELOAD SHADER-------------" << std::endl;
    GLobal_Shader->compile();
    set_uniform(Global_mode, *GLobal_Shader);
    Global_IsSaved = false;
  }
}

void framebuffer_size_callback(GLFWwindow * window, int width, int height) {
  std::cout << "framebuffer size"<< width << height <<std::endl;
  glViewport(0, 0, width, height);
}

void glfw_error_callback(int error, const char * description) {
  fprintf(stderr, "GLFW Error: %s\n", description);
}

void generate_mipmap(
  unsigned int VAO,
  Shader & specular_shader,
  int mode) {
  /*
  * 生成spaceobject_detail_astroid_uv_ao的mipmap
  */
  int width, height;
  get_resolution(width, height, mode);
  // 创建FrameBuffer生成离线渲染贴图
  for (int i=0; i < 8; i++) {
    unsigned int fbo;
    glGenFramebuffers(1, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    // 生成color attachment
    unsigned int textureColorbuffer;
    glGenTextures(1, &textureColorbuffer);
    glBindTexture(GL_TEXTURE_2D, textureColorbuffer);
    glTexImage2D(
      GL_TEXTURE_2D, 0, GL_RGB, width, height,
      0, GL_RGB, GL_UNSIGNED_BYTE, NULL);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glFramebufferTexture2D(
      GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0,
      GL_TEXTURE_2D, textureColorbuffer, 0);
    // 绘制测试
    glViewport(0, 0, width, height);
    bind_textures(mode);
    // shader
    specular_shader.compile();
    set_uniform(mode, specular_shader);
    specular_shader.setVec2("resolution", width, height);
    glBindVertexArray(VAO);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);

    char * tbuffer = new char[width*height*3];
    glReadPixels(
            0, 0, width, height, GL_RGB, GL_UNSIGNED_BYTE, (void *) tbuffer);

    stbi_flip_vertically_on_write(true);
    char file_name[80];
    sprintf(file_name, "../textures/mip%d.tga", i);
    stbi_write_tga(file_name,
                  width, height, STBI_rgb,
                  tbuffer);
    delete []tbuffer;
    glDeleteFramebuffers(1, &fbo);
    width /= 2;
    height /= 2;
  }
}

GLuint create_texture(const char * texture_path) {
  /*
  * 输入贴图位置创建OpenGLTexture
  * @param texture_path: 贴图路径
  * @return texture object id
  */
  GLuint texture_obj_id;
  glGenTextures(1, &texture_obj_id);
  glBindTexture(GL_TEXTURE_2D, texture_obj_id);
  // 设置texture warpping params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  // 设置texture filter params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  int width, height, nrChannels;
  unsigned char * data;
  GLenum texture_format = GL_RGB;
  data = stbi_load(
    texture_path, &width, &height, &nrChannels, 0);

  if (nrChannels == 4) {
    texture_format = GL_RGBA;
  }

  if (data) {
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,
    width, height, 0, texture_format, GL_UNSIGNED_BYTE, data);
    glGenerateMipmap(GL_TEXTURE_2D);
  } else {
    std::cout << "FAILED TO LOAD RG TEXTURE: " << texture_path << std::endl;
    return -1;
  }
  stbi_image_free(data);
  return texture_obj_id;
}

void get_resolution(int & width, int & height, int mode) {
  /*
  * 获得当前处理模式的显示处理结果贴图的分辨率
  * @param width, height: 返回resolution的width，height
  * @param mode:
  *    0: 三层贴图融合：spaceobject_detail:asteroid_uv2_ao
  *    1: 基础normal和一层贴图融合: spaceobject_asteroid_uv2_ao
  *    2: 基础normal: spaceobject_uv_ao
  */
  width = 1024;
  height = 1024;
  if (mode == 0) {
    width = 512;
    height = 512;
  }
  if (mode == 1 || mode == 2) {
    width = 1024;
    height = 1024;
  }
}

Shader generate_shader(int mode) {
  /*
  * 生成对应模式的shader
  * @param mode:
  *    0: 三层贴图融合：spaceobject_detail:asteroid_uv2_ao
  *    1: 基础normal和一层贴图融合: spaceobject_asteroid_uv2_ao
  *    2: 基础normal: spaceobject_uv_ao
  * @return 生成的shader
  */
  if (mode == 0) {
    Shader specular_shader(
     "../shader/toksvig_vs.glsl", "../shader/toksvig_fs.glsl");
     return specular_shader;
  }
  if (mode == 1) {
    Shader specular_shader(
     "../shader/toksvig_vs.glsl", "../shader/noise_normal.glsl");
    return specular_shader;
  }
  if (mode == 2) {
    Shader specular_shader(
     "../shader/toksvig_vs.glsl", "../shader/uv_ao.glsl");
     return specular_shader;
  }
}

void set_uniform(int mode, Shader specular_shader) {
  /*
  * 根据mode设置uniform
  * @param mode:
  *    0: 三层贴图融合：spaceobject_detail:asteroid_uv2_ao
  *    1: 基础normal和一层贴图融合: spaceobject_asteroid_uv2_ao
  *    2: 基础normal: spaceobject_uv_ao
  */
  specular_shader.use();
  if (mode == 0) {
    specular_shader.setInt("detail1", 0);
    specular_shader.setInt("detail2", 1);
    specular_shader.setInt("detail3", 2);
    int width, height;
    get_resolution(width, height, mode);
    specular_shader.setVec2("resolution", width, height);
  }
  if (mode == 1) {
    specular_shader.setInt("noise_texture", 0);
    specular_shader.setInt("pmwo_texture", 1);
    specular_shader.setInt("normal_texture", 2);
    int width, height;
    get_resolution(width, height, mode);
    specular_shader.setVec2("resolution", width, height);
  }
  if (mode == 2) {
    specular_shader.setInt("normal_texture", 0);
    int width, height;
    get_resolution(width, height, mode);
    specular_shader.setVec2("resolution", width, height);
  }
}

void set_textures(int mode) {
  /*
  * 根据mode设置贴图
  * @param mode:
  *    0: 三层贴图融合：spaceobject_detail:asteroid_uv2_ao
  *    1: 基础normal和一层贴图融合: spaceobject_asteroid_uv2_ao
  *    2: 基础normal: spaceobject_uv_ao
  */
  if (mode == 0) {
    texture_obj_ids[0] = create_texture("../textures/detail1.tga");
    texture_obj_ids[1] = create_texture("../textures/detail2.tga");
    texture_obj_ids[2] = create_texture("../textures/detail3.tga");
  }
  if (mode == 1) {
    texture_obj_ids[0] = create_texture("../textures/noise.png");
    texture_obj_ids[1] = create_texture("../textures/pmwo.tga");
    texture_obj_ids[2] = create_texture("../textures/normal_texture.tga");
  }
  if (mode == 2) {
    texture_obj_ids[0] = create_texture(
                          // "../textures/yc_jz_16844_xxxejzmz_n.tga");
                          // "../textures/yc_jz_16843_xxxjg_n.tga");
                          "../textures/normal_texture.tga");
  }
}

void bind_textures(int mode) {
  /*
  * 根据mode绑定贴图
  * @param mode:
  *    0: 三层贴图融合：spaceobject_detail:asteroid_uv2_ao
  *    1: 基础normal和一层贴图融合: spaceobject_asteroid_uv2_ao
  *    2: 基础normal: spaceobject_uv_ao
  */ 
  GLenum texture_ids[4] = {GL_TEXTURE0, GL_TEXTURE1, GL_TEXTURE2, GL_TEXTURE3};
  int texture_cnt = 0;
  if (mode == 0) {
    texture_cnt = 3;
  }
  if (mode == 1) {
    texture_cnt = 3;
  }
  if (mode == 2) {
    texture_cnt = 1;
  }
  for (int idx=0; idx < texture_cnt; idx++) {
    GLenum texture_id = texture_ids[idx];
    glActiveTexture(texture_id);
    glBindTexture(GL_TEXTURE_2D, texture_obj_ids[idx]);
  }
}
