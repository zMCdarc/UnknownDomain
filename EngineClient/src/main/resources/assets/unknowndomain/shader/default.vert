#version 330 core

layout (location = 0) in vec3 position;
layout (location = 1) in vec4 color;
layout (location = 2) in vec2 texcoord;
layout (location = 3) in vec3 normal;

out vec4 vertexColor;
out vec3 vertexNormal;
out vec3 vertexMv;
out vec2 textureCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main() {
    vertexColor = color;
    textureCoord = texcoord;
    mat4 mvp = projection * view * model;
    vertexNormal = normal((view * model) * vec4(normal, 0.0)).xyz;
    vertexMv = (view * model * vec4(position, 1.0)).xyz;
    gl_Position = mvp * vec4(position, 1.0);
}