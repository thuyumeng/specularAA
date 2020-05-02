#include <glad/gl.h>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

#include <graphics/shader.h>
#include <iostream>

void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void processInput(GLFWwindow * window);
void glfw_error_callback(int error, const char * description);

// setting
const unsigned int SCR_WIDTH = 1280;
const unsigned int SCR_HEIGHT = 768;

int main()
{
    // glfw: 初始化和配置界面
    glfwInit();

    // OpenGL 3.2 以上 core profile模式
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwSetErrorCallback(glfw_error_callback);

    // 创建window
    GLFWwindow* window = glfwCreateWindow(
        SCR_WIDTH,
        SCR_HEIGHT,
        "instance",
        NULL,
        NULL
    );
    if (window == NULL) {
        std::cout << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    //glad: 加载OpenGL的函数
    if (!gladLoadGL(glfwGetProcAddress)) {
        std::cout << "Failed to initialize GLAD" << std::endl;
        return -1;
    }

    glEnable(GL_DEPTH_TEST);
    Shader shader("../shader/instance.vs", "../shader/instance.fs");

    int cnt = 3;
    glm::vec2 translations[cnt - 1];
    int index = 0;
    float offset = 0.1f;
    for (int y = -10; y < 10; y+=2) {
        for (int x = -10; x < 10; x += 2) {
            glm::vec2 translation;
            translation.x = (float)x / 10.0f + offset;
            translation.y = (float)y / 10.0f + offset;
            translations[index++] = translation;
            std::cout <<"check index:" << index << std::endl;
            if (index >= cnt) {
                break;
            }
        }
    }

    // 把instance data传递到array data上
    unsigned int instanceVBO;
    glGenBuffers(1, &instanceVBO);
    glBindBuffer(GL_ARRAY_BUFFER, instanceVBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(glm::vec2) * cnt, &translations[0], GL_STATIC_DRAW);

    // set up vertex data (and buffer(s)) and configure vertex attributes
    // ------------------------------------------------------------------
    float quadVertices[] = {
        // positions     // colors
        -0.05f,  0.05f,  1.0f, 0.0f, 0.0f,
         0.05f, -0.05f,  0.0f, 1.0f, 0.0f,
        -0.05f, -0.05f,  0.0f, 0.0f, 1.0f,

        -0.05f,  0.05f,  1.0f, 0.0f, 0.0f,
         0.05f, -0.05f,  0.0f, 1.0f, 0.0f,
         0.05f,  0.05f,  0.0f, 1.0f, 1.0f
    };
    unsigned int quadVAO, quadVBO;
    glGenVertexArrays(1, &quadVAO);
    glGenBuffers(1, &quadVBO);
    glBindVertexArray(quadVAO);
    glBindBuffer(GL_ARRAY_BUFFER, quadVBO);
    glBufferData(
        GL_ARRAY_BUFFER,
        sizeof(quadVertices),
        quadVertices,
        GL_STATIC_DRAW);

    // positions
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(
        0, 2, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)0);
    // colors
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(
        1, 3, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)(2 * sizeof(float)));
    // instance data oofset
    glEnableVertexAttribArray(2);
    glBindBuffer(GL_ARRAY_BUFFER, instanceVBO);
    std::cout<< "check 0" << std::endl;
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 2 * sizeof(float), (void*)0);
    // 完成顶点VAO配置
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    // 配置instance buffer的index和刷新频率
    glVertexAttribDivisor(2, 2);
    std::cout<< "check 1" << std::endl;
    // render loop
    while (!glfwWindowShouldClose(window)) {
        glClearColor(0.1f, 0.1f, 0.1f, 0.1f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        shader.use();
        glBindVertexArray(quadVAO);
        glDrawArraysInstanced(GL_TRIANGLES, 0, 6, cnt);
        
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glDeleteVertexArrays(1, &quadVAO);
    glDeleteBuffers(1, &quadVBO);

    glfwTerminate();
}

void processInput(GLFWwindow * window) {
  if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
    glfwSetWindowShouldClose(window, true);
  // 摁下“K”键可以刷新shader
  if (glfwGetKey(window, GLFW_KEY_H) == GLFW_PRESS) {
    std::cout << "\n------------RELOAD SHADER-------------" << std::endl;
  }
}

void framebuffer_size_callback(GLFWwindow * window, int width, int height) {
  std::cout << "framebuffer size"<< width << height <<std::endl;
  glViewport(0, 0, width, height);
}

void glfw_error_callback(int error, const char * description) {
  fprintf(stderr, "GLFW Error: %s\n", description);
}