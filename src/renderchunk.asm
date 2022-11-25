// Minecraft - New Nintendo 3DS Edition 
// renderchunk.shbin

// Handcoded by ENDERMANYK

// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )  //uniform MAT4 WORLDVIEWPROJ; 
#pragma bind_symbol ( WORLDVIEW , c4 , c7 )      //uniform MAT4 WORLDVIEW;
#pragma bind_symbol ( PROJ , c8 , c11 )          //uniform MAT4 PROJ;
#pragma bind_symbol ( FOG_COLOR , c12 )          //uniform vec4 FOG_COLOR;
#pragma bind_symbol ( FOG_CONTROL , c13 )        //uniform vec2 FOG_CONTROL;
#pragma bind_symbol ( RENDER_DISTANCE , c14 )    //uniform float RENDER_DISTANCE;
#pragma bind_symbol ( VIEWPORT_DIMENSION , c15 ) //uniform vec2 VIEWPORT_DIMENSION;
#pragma bind_symbol ( CURRENT_COLOR , c16 )      //uniform vec4 CURRENT_COLOR;
#pragma bind_symbol ( CHUNK_ORIGIN_AND_SCALE , c17 )//uniform POS4 CHUNK_ORIGIN_AND_SCALE;
#pragma bind_symbol ( VIEW_POS , c18 )           //uniform POS3 VIEW_POS;
#pragma bind_symbol ( FAR_CHUNKS_DISTANCE , c19 )//uniform float FAR_CHUNKS_DISTANCE;

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 ) //attribute POS4 POSITION;
#pragma bind_symbol ( aColor.xyzw , v1 )   //attribute vec4 COLOR;
#pragma bind_symbol ( aTexCoord.xy , v2 )  //attribute vec2 TEXCOORD_0;
#pragma bind_symbol ( bTexCoord.xy , v3 )  //attribute vec2 TEXCOORD_1;

// Booleans
#pragma bind_symbol ( ENABLE_FOG , b1 , b1 ) //bool
#pragma bind_symbol ( ALLOW_FADE , b2 , b2 )

// Outputs, varing
#pragma output_map ( position , o0 )  //gl_Position
#pragma output_map ( color , o1 )     //varing vec4 color;
#pragma output_map ( texture0 , o2 )  //varing vec2 uv0;
#pragma output_map ( texture1 , o3 )  //varing vec2 uv1;

def c32, 1.000000, -1.000000, 1.000000, 1.000000
def c33, 0.003922, 0.003922, 0.003922, 0.003922
def c34, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c35, 0.000000, 0.000000, 0.000000, 0.000000
def c36, 1.900000, 1.900000, 1.900000, 1.900000
def c51, 0.000000, 1.000000, 0.025000, 0.022346

normalizedepth:
mul r0.z, r0.zzzz, r0.wwww
add r0.z, -c51.zzzz, r0.zzzz
mul r0.z, c51.wwww, r0.zzzz
ret
endnormalizedepth:

main:
mul r0.xyz, c17.wwww, v0.xyzz  // worldPos.xyz = (POSITION.xyz * CHUNK_ORIGIN_AND_SCALE.w) + CHUNK_ORIGIN_AND_SCALE.xyz
add r1.xyz, c17.xyzz, r0.xyzz  // r1 = worldPos
mov r1.w, c32.xxxx             // worldPos.w = 1.0
mov r3.xyzw, r1.xyzw
add r1.xyz, c17.xyzz, r0.xyzz
mov r1.w, c32.xxxx
dp4 r2.x, c4.xyzw, r1.xyzw     // POS4 pos = WORLDVIEW * worldPos
dp4 r2.y, c5.xyzw, r1.xyzw
dp4 r2.z, c6.xyzw, r1.xyzw
dp4 r2.w, c7.xyzw, r1.xyzw
dp4 r0.x, c8.xyzw, r2.xyzw     // pos = PROJ * pos
dp4 r0.y, c9.xyzw, r2.xyzw
dp4 r0.z, c10.xyzw, r2.xyzw
dp4 r0.w, c11.xyzw, r2.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c32.xyzw, r0.xyzw // gl_Position = pos
mul o1.xyzw, c33.xyzw, v1.xyzw // color = COLOR
mul r0.xyzw, c34.xyzw, v2.xyzw
slt r1.xyzw, r0.xyzw, c35.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o2.xyzw, r2.xyzw           // uv0 = TEXCOORD_0
mul r0.xyzw, c34.xyzw, v3.xyzw
slt r1.xyzw, r0.xyzw, c35.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o3.xyzw, r2.xyzw           // uv1 = TEXCOORD_1
end
endmain: