// Minecraft - New Nintendo 3DS Edition 
// guardian_ghost.shbin

// Handcoded by ENDERMANYK

// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( TILE_LIGHT_COLOR , c4 )
#pragma bind_symbol ( WORLD , c9 , c12 )
#pragma bind_symbol ( UV_ANIM , c13 )
#pragma bind_symbol ( UV_OFFSET , c14 )
#pragma bind_symbol ( OVERLAY_COLOR , c15 )
#pragma bind_symbol ( CHANGE_COLOR , c16 )
#pragma bind_symbol ( GLINT_COLOR , c17 )
#pragma bind_symbol ( UV_ROTATION , c18 )
#pragma bind_symbol ( GLINT_UV_SCALE , c19 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )
#pragma bind_symbol ( aNormal.xyzw , v2 )
#pragma bind_symbol ( aColor.xyzw , v3 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( color , o2 )
#pragma output_map ( texture1 , o3 )
#pragma output_map ( texture2 , o4 )

def c20, 1.000000, -1.000000, 1.000000, 1.000000
def c21, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c22, 0.000000, 0.000000, 0.000000, 0.000000
def c40, 1.000000, 0.500000, -0.099999, 0.099999
def c41, 0.449997, 0.549995, 0.349998, 0.000000
def c43, 1.000000, 1.000000, 1.000000, 1.000000
def c44, 0.003922, 0.003922, 0.003922, 0.003922
def c93, -0.500000, -0.166666, 1.000000, 1.000000
def c94, -0.001389, -0.000198, 0.041667, 0.008333
def c95, -0.000000, -0.000000, 0.000025, 0.000003

lightintensity:
dp4 r15.x, c9.xyzw, v2.xyzw
dp4 r15.y, c10.xyzw, v2.xyzw
dp4 r15.z, c11.xyzw, v2.xyzw
dp4 r15.w, c12.xyzw, v2.xyzw
dp4 r1.x, r15.xyzz, r15.xyzz
rsq r1.x, r1.xxxx
mul r1.xyz, r15.xyzz, r1.xxxx
mul r1.y, c4.wwww, r1.yyyy
add r15.y, c40.xxxx, r1.yyyy
mul r15.y, c40.yyyy, r15.yyyy
mul r15.x, r1.xxxx, r1.xxxx
mul r15.x, c40.zzzz, r15.xxxx
mul r15.z, r1.zzzz, r1.zzzz
mul r15.z, c40.wwww, r15.zzzz
mul r1.x, c41.yyyy, r15.yyyy
add r1.x, r1.xxxx, r15.xxxx
add r1.x, r1.xxxx, r15.zzzz
add r1.x, c41.xxxx, r1.xxxx
ret
endlightintensity:

calculateLayerUV:
add r9.xyzw, -c40.yyyy, r2.xyzw
mov r11.xyzw, c95.xyzw
mov r12.xyzw, c94.xyzw
mul r2.z, r10.xxxx, r10.xxxx
mad r2.xy, v13.zzzz, r11.xyyy, r11.zwww
mad r2.xy, v9.zzzz, r2.xyyy, r12.xyyy
mad r2.xy, v9.zzzz, r2.xyyy, r12.zwww
mov r11.xyzw, c93.xyzw
mad r2.xy, v9.zzzz, r2.xyyy, r11.xyyy
mad r2.xy, v9.zzzz, r2.xyyy, r11.zwww
mul r2.y, r2.yyyy, r10.xxxx
mov r11.x, r2.xxxx
mov r11.y, -r2.yyyy
mov r11.z, c41.wwww
mov r12.x, r2.yyyy
mov r12.y, r2.xxxx
mov r12.z, c41.wwww
dp3 r2.x, r9.xyzw, r11.xyzw
dp3 r2.y, r9.xyzw, r12.xyzw
add r2.x, r2.xxxx, r10.yyyy
add r2.xyzw, c40.yyyy, r2.xyzw
mul r2.xyzw, c17.xyzw, r2.xyzw
mov r9.xyzw, r2.xyzw
ret
endcalculateLayerUV:

main:
dp4 r0.x, c0.xyzw, v0.xyzw
dp4 r0.y, c1.xyzw, v0.xyzw
dp4 r0.z, c2.xyzw, v0.xyzw
dp4 r0.w, c3.xyzw, v0.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c20.xyzw, r0.xyzw
mul r0.xyzw, c21.xyzw, v1.xyzw
slt r1.xyzw, r0.xyzw, c22.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov r2.w, c20.wwww
mov r15.xyzw, r2.xyzw
mov r10.x, c18.xxxx
mov r10.y, c14.xxxx
call calculateLayerUV
mov o3.xyzw, r9.xyzw
mov r2.xyzw, r15.xyzw
mov r10.x, c18.yyyy
mov r10.y, c14.yyyy
call calculateLayerUV
mov o4.xyzw, r9.xyzw
call lightintensity
mov r2.y, c15.wwww
mul r2.x, c41.zzzz, r2.yyyy
add r1.x, r1.xxxx, r2.xxxx
mul r0.xyz, c4.xyzz, r1.xxxx
mov r0.w, c40.xxxx
mov r8.xyzw, c43.xyzw
mul r7.xyzw, c44.xyzw, v3.xyzw
mul r0.xyzw, r0.xyzw, r7.xyzw
mul r1.xyz, c16.xyzz, r8.xyzz
add r2.xyz, r1.xyzz, -r8.xyzz
mad r2.xyz, v12.xyzw, r8.wwww, r8.xyzz
mov r8.xyz, r2.xyzz
mov r1.x, c15.wwww
add r2.xyz, c15.xyzw, -r8.xyzw
mad r2.xyz, v8.xyzw, r1.xxxx, r8.xyzw
mov r8.xyz, r2.xyzz
mul r8.xyzw, r8.xyzw, r0.xyzw
mov o2.xyzw, r8.xyzw
end
endmain:
