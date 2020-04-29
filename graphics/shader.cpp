/*
 * @Description: code for fun
 * @Author: yumeng
 * @Github: git@github.com:thuyumeng/
 * @Date: 2020-02-19 08:57:34
 * @LastEditors: yumeng
 * @LastEditTime: 2020-02-19 21:13:28
 */
#include "graphics/shader.h"

#include <fstream>
#include <sstream>
#include <iostream>

Shader::Shader(const char *vertexPath, const char *fragmentPath, const char *
    geometryPath) {
        m_vertexPath = vertexPath;
        m_fragmentPath = fragmentPath;
        if (geometryPath != nullptr) {
            m_geometryPath = geometryPath;
            m_use_geometry = true;
        } else {
            m_use_geometry = false;
        }
        ID = 0;
        compile();
}

void Shader::compile() {
        if (ID != 0)
            glDeleteProgram(ID);

        const char * vertexPath = m_vertexPath.c_str();
        const char * fragmentPath = m_fragmentPath.c_str();
        const char * geometryPath = nullptr;
        if (m_use_geometry)
         geometryPath = m_geometryPath.c_str();

        std::string vertexCode;
        std::string fragmentCode;
        std::string geometryCode;
        std::ifstream vShaderFile;
        std::ifstream fShaderFile;
        std::ifstream gShaderFile;

        // 编译shader和异常处理
        vShaderFile.exceptions(std::ifstream::failbit | std::ifstream::badbit);
        fShaderFile.exceptions(std::ifstream::failbit | std::ifstream::badbit);
        gShaderFile.exceptions(std::ifstream::failbit | std::ifstream::badbit);
        try {
            vShaderFile.open(vertexPath);
            fShaderFile.open(fragmentPath);
            std::stringstream vShaderStream, fShaderStream;

            vShaderStream << vShaderFile.rdbuf();
            fShaderStream << fShaderFile.rdbuf();

            vShaderFile.close();
            fShaderFile.close();

            vertexCode = vShaderStream.str();
            fragmentCode = fShaderStream.str();

            if (geometryPath != nullptr) {
                gShaderFile.open(geometryPath);
                std::stringstream gShaderStream;
                gShaderStream << gShaderFile.rdbuf();
                gShaderFile.close();
                geometryCode = gShaderStream.str();
            }
        }
        catch (std::ifstream::failure e) {
            std::cout << "ERROR::SHADER::FILE_NOT_SUCCESFULLY_READ"
            << std::endl;
        }

        const char * vShaderCode = vertexCode.c_str();
        const char * fShaderCode = fragmentCode.c_str();
        unsigned int vertex, fragment;
        // vertex shader
        vertex = glCreateShader(GL_VERTEX_SHADER);
        glShaderSource(vertex, 1, &vShaderCode, NULL);
        glCompileShader(vertex);
        checkCompileErrors(vertex, "VERTEX");
        // fragment shader
        fragment = glCreateShader(GL_FRAGMENT_SHADER);
        glShaderSource(fragment, 1, &fShaderCode, NULL);
        glCompileShader(fragment);
        checkCompileErrors(fragment, "FRAGMENT");
        // geometry shader
        unsigned int geometry;
        if (geometryPath != nullptr) {
            const char * gShaderCode = geometryCode.c_str();
            geometry = glCreateShader(GL_GEOMETRY_SHADER);
            glShaderSource(geometry, 1, &gShaderCode, NULL);
            checkCompileErrors(geometry, "GEOMETRY");
        }
        // shader program
        ID = glCreateProgram();
        glAttachShader(ID, vertex);
        glAttachShader(ID, fragment);
        if (geometryPath != nullptr)
            glAttachShader(ID, geometry);
        glLinkProgram(ID);
        checkCompileErrors(ID, "PROGRAM");
        glDeleteShader(vertex);
        glDeleteShader(fragment);
        if (geometryPath != nullptr)
            glDeleteShader(geometry);
}

void Shader::use() {
    glUseProgram(ID);
}

// 设置uniform
void Shader::setBool(const std::string &name, bool value) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    // 编译时静态转换类型
    glUniform1i(location, static_cast<int>(value));
}

void Shader::setInt(const std::string &name, int value) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform1i(location, value);
}

void Shader::setFloat(const std::string &name, float value) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform1f(location, value);
}

void Shader::setVec2(const std::string &name, const glm::vec2 &value) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform2fv(location, 1, &value[0]);
}

void Shader::setVec2(const std::string &name, float x, float y) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform2f(location, x, y);
}

void Shader::setVec3(const std::string &name, const glm::vec3 &value) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform3fv(location, 1, &value[0]);
}

void Shader::setVec3(const std::string &name, float x, float y, float z) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform3f(location, x, y, z);
}

void Shader::setVec4(const std::string &name, const glm::vec4 &value) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform4fv(location, 1, &value[0]);
}

void Shader::setVec4(const std::string &name,
float x, float y, float z, float w) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniform4f(location, x, y, z, w);
}

void Shader::setMat2(const std::string &name, const glm::mat2 &mat) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniformMatrix2fv(location, 1, GL_FALSE, &mat[0][0]);
}

void Shader::setMat3(const std::string &name, const glm::mat3 &mat) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniformMatrix3fv(location, 1, GL_FALSE, &mat[0][0]);
}

void Shader::setMat4(const std::string &name, const glm::mat4 &mat) const {
    GLint location = glGetUniformLocation(ID, name.c_str());
    glUniformMatrix4fv(location, 1, GL_FALSE, &mat[0][0]);
}

void Shader::checkCompileErrors(GLuint shader, std::string type) {
    GLint success;
    GLchar infoLog[1024];
    if (type != "PROGRAM") {
        glGetShaderiv(shader, GL_COMPILE_STATUS, &success);
        if (!success) {
            glGetShaderInfoLog(shader, 1024, NULL, infoLog);
            std::cout << "ERROR: SHADER_COMPILATION_ERROR OF type: " << type
            << "\n" << infoLog << std::endl;
        }
    } else {
        glGetProgramiv(shader, GL_LINK_STATUS, &success);
        if (!success) {
            glGetProgramInfoLog(shader, 1024, NULL, infoLog);
            std::cout << "ERROR: PROGRAM_LINKING_ERROR of type: " << type
            << "\n" << infoLog << std::endl;
        }
    }
}
