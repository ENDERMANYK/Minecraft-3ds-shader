// Minecraft - New Nintendo 3DS Edition 
// color_uv_glint.shbin



// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( DARKEN , c4 )
#pragma bind_symbol ( UV_OFFSET , c14 )
#pragma bind_symbol ( GLINT_UV_SCALE , c17 )
#pragma bind_symbol ( UV_ROTATION , c18 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )
#pragma bind_symbol ( aColor.xyzw , v2 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( texture0 , o1 )
#pragma output_map ( color , o2 )
#pragma output_map ( texture1 , o3 )
#pragma output_map ( texture2 , o4 )

def c19, 1.000000, -1.000000, 1.000000, 1.000000
def c20, 0.003922, 0.003922, 0.003922, 0.003922
def c21, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c22, 0.000000, 0.000000, 0.000000, 0.000000
def c93, -0.500000, -0.166666, 1.000000, 1.000000
def c94, -0.001389, -0.000198, 0.041667, 0.008333
def c95, -0.000000, -0.000000, 0.000025, 0.000003

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
mul o0.xyzw, c19.xyzw, r0.xyzw
mul r5.xyzw, c20.xyzw, v2.xyzw
mul r6.xyzw, c4.xyzw, r5.xyzw
mov r6.w, c19.wwww
mov o2.xyzw, r6.xyzw
mul r0.xyzw, c21.xyzw, v1.xyzw
slt r1.xyzw, r0.xyzw, c22.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o1.xyzw, r2.xyzw
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
end
endmain:

