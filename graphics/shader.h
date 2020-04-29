/*
 * @Description: code for fun
 * @Author: yumeng
 * @Github: git@github.com:thuyumeng/
 * @Date: 2020-02-19 08:10:52
 * @LastEditors: yumeng
 * @LastEditTime: 2020-02-19 16:51:07
 */
#ifndef GRAPHICS_SHADER_H_
#define GRAPHICS_SHADER_H_


#include <glad/gl.h>
#include <glm/glm.hpp>

#include <string>

class Shader {
 public:
    // 实时生成的shader ID
    unsigned int ID;

    // 构造shader并且编译
    Shader(const char *vertexPath, const char *fragmentPath, const char *
    geometryPath = (const char *)nullptr);

    // 应用shader
    void compile();
    void use();
    // 设置uniform的函数
    void setBool(const std::string &name, bool value) const;
    void setInt(const std::string &name, int value) const;
    void setFloat(const std::string &name, float value) const;
    void setVec2(const std::string &name, const glm::vec2 &value) const;
    void setVec2(const std::string &name, float x, float y) const;
    void setVec3(const std::string &name, const glm::vec3 &value) const;
    void setVec3(const std::string &name, float x, float y, float z) const;
    void setVec4(const std::string &name, const glm::vec4 &value) const;
    void setVec4(const std::string &name, float x, float y, float z,
    float w) const;
    void setMat2(const std::string &name, const glm::mat2 &mat) const;
    void setMat3(const std::string &name, const glm::mat3 &mat) const;
    void setMat4(const std::string &name, const glm::mat4 &mat) const;

 private:
    void checkCompileErrors(GLuint shader, std::string type);
    std::string m_vertexPath;
    std::string m_fragmentPath;
    std::string m_geometryPath;

    bool m_use_geometry;
};
#endif  // GRAPHICS_SHADER_H_
