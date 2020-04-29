/*
 * @Description: code for fun
 * @Author: yumeng
 * @Github: git@github.com:thuyumeng/
 * @Date: 2020-02-18 17:35:24
 * @LastEditors: yumeng
 * @LastEditTime: 2020-02-26 15:11:02
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

void framebuffer_size_callback(GLFWwindow * window, int width, int height);
void processInput(GLFWwindow * window);
void glfw_error_callback(int error, const char * description);
void generate_mipmap(
  int width, int height, int detail1, int detail2, int detail3, unsigned int VAO,
  Shader & specular_shader);

// 全局Shader方便重新加载编译
Shader * GLobal_Shader;
int SCR_WIDTH, SCR_HEIGHT;
bool Global_IsSaved;
// 拷贝Framebuffer的缓存
char * tbuffer = NULL;

int main() {
  // 加载texture
  int width, height, nrChannels;
  unsigned char * data = stbi_load(
    "../textures/detail1.tga", &width, &height, &nrChannels, 0);

  if (!data) {
    std::cout << "FAILED TO LOAD TEXTURE" << std::endl;
    return -1;
  }
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

  // Shader
  Shader specular_shader(
    "../shader/toksvig_vs.glsl", "../shader/vmf_fs.glsl");
  GLobal_Shader = &specular_shader;

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
  unsigned int detail1, detail2, detail3;
  glGenTextures(1, &detail1);
  glBindTexture(GL_TEXTURE_2D, detail1);
  // 设置texture warpping params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  // 设置texture filter params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  if (data) {
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,
    width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
    glGenerateMipmap(GL_TEXTURE_2D);
  } else {
    std::cout << "FAILED TO LOAD TEXTURE" << std::endl;
    return -1;
  }
  stbi_image_free(data);

  // rg texture
  glGenTextures(1, &detail2);
  glBindTexture(GL_TEXTURE_2D, detail2);
  // 设置texture warpping params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  // 设置texture filter params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  data = stbi_load(
    "../textures/detail2.tga", &width, &height, &nrChannels, 0);
  if (data) {
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,
    width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
    glGenerateMipmap(GL_TEXTURE_2D);
  } else {
    std::cout << "FAILED TO LOAD RG TEXTURE" << std::endl;
    return -1;
  }
  stbi_image_free(data);

  glGenTextures(1, &detail3);
  glBindTexture(GL_TEXTURE_2D, detail3);
  // 设置texture warpping params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  // 设置texture filter params
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  data = stbi_load(
    "../textures/detail3.tga", &width, &height, &nrChannels, 0);
  if (data) {
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,
    width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
    glGenerateMipmap(GL_TEXTURE_2D);
  } else {
    std::cout << "FAILED TO LOAD RG TEXTURE" << std::endl;
    return -1;
  }
  stbi_image_free(data);
  
  // 设置shader 的 texture unit
  specular_shader.use();
  specular_shader.setInt("detail1", 0);
  specular_shader.setInt("detail2", 1);
  specular_shader.setInt("detail3", 2);
  
  // 生成mipmap 贴图
  generate_mipmap(
    width, height, detail1, detail2, detail3, VAO,
    specular_shader);

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

    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, detail1);
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, detail2);
    glActiveTexture(GL_TEXTURE2);
    glBindTexture(GL_TEXTURE_2D, detail3);

    // 渲染部分
    specular_shader.use();
    specular_shader.setVec2("resolution", SCR_WIDTH, SCR_HEIGHT);
    glBindVertexArray(VAO);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);

    // 存储预处理结果
    if (!Global_IsSaved) {
      // stbi_write_png("../textures/result.png",
      //              width, height, 4,
      //              buffer + (width * 4 * (height - 1)),
      //              -width * 4);
      std::cout<< "bbb here result tga" <<twidth << theight << std::endl;
      std::cout << SCR_WIDTH << SCR_HEIGHT << ":" << nrChannels <<std::endl;
      tbuffer = new char[twidth*theight*nrChannels];
      glReadPixels(
        0, 0, twidth, theight, GL_RGB, GL_UNSIGNED_BYTE, (void *) tbuffer);
      
      // stbir_resize_uint8((unsigned char *)tbuffer + (twidth * nrChannels * (theight - 1)),
      //                     twidth, theight, -twidth * nrChannels,
      //                     (unsigned char *)tbuffer, SCR_WIDTH, SCR_HEIGHT, 0,
      //                     nrChannels);
      stbir_resize_uint8((unsigned char *)tbuffer,
                          twidth, theight, 0,
                          (unsigned char *)tbuffer, SCR_WIDTH, SCR_HEIGHT, 0,
                          nrChannels);
      
      stbi_flip_vertically_on_write(true);
      stbi_write_tga("../textures/result.tga",
                    SCR_WIDTH, SCR_HEIGHT, STBI_rgb,
                    tbuffer);
      delete []tbuffer;
      tbuffer = NULL;
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

  if (tbuffer != NULL)
    delete []tbuffer;

  glfwTerminate();
  return 0;
}

void processInput(GLFWwindow * window) {
  if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
    glfwSetWindowShouldClose(window, true);
  // 摁下“K”键可以刷新shader
  if (glfwGetKey(window, GLFW_KEY_H) == GLFW_PRESS) {
    std::cout << "\n-------------------RELOAD SHADER----------------------" << std::endl;
    GLobal_Shader->compile();
    GLobal_Shader->use();
    GLobal_Shader->setInt("detail1", 0);
    GLobal_Shader->setInt("detail2", 1);
    GLobal_Shader->setInt("detail3", 2);
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
  int width, int height, int detail1, int detail2, int detail3, unsigned int VAO,
  Shader & specular_shader) {
  // 创建FrameBuffer生成离线渲染贴图
  for (int i=0; i<8; i++) {
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
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, detail1);
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, detail2);
    glActiveTexture(GL_TEXTURE2);
    glBindTexture(GL_TEXTURE_2D, detail3);

    // shader
    specular_shader.compile();
    specular_shader.use();
    specular_shader.setInt("detail1", 0);
    specular_shader.setInt("detail2", 1);
    specular_shader.setInt("detail3", 2);
    specular_shader.setVec2("resolution_mip0", SCR_WIDTH, SCR_WIDTH);
    specular_shader.setInt("miplevel", i);
    glBindVertexArray(VAO);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);

    tbuffer = new char[width*height*3];
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