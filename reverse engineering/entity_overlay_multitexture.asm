// Minecraft - New Nintendo 3DS Edition 
// entity_overlay_multitexture.shbin

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

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( texture0 , o1 )
#pragma output_map ( color , o2 )
#pragma output_map ( texture1 , o3 )
#pragma output_map ( texture2 , o4 )

def c20, 1.000000, -1.000000, 1.000000, 1.000000
def c21, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c22, 0.000000, 0.000000, 0.000000, 0.000000
def c40, 1.000000, 0.500000, -0.099999, 0.099999
def c41, 0.449997, 0.549995, 0.349998, 0.000000
def c43, 1.000000, 1.000000, 1.000000, 1.000000

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
mov o1.xyzw, r2.xyzw
mov o3.xyzw, r2.xyzw
mov o4.xyzw, r2.xyzw
call lightintensity
mov r2.y, c15.wwww
mul r2.x, c41.zzzz, r2.yyyy
add r1.x, r1.xxxx, r2.xxxx
mul r0.xyz, c4.xyzz, r1.xxxx
mov r0.w, c40.xxxx
mov r8.xyzw, c43.xyzw
mov r1.x, c15.wwww
add r2.xyz, c15.xyzw, -r8.xyzw
mad r2.xyz, v8.xyzw, r1.xxxx, r8.xyzw
mov r8.xyz, r2.xyzz
mul r8.xyzw, r8.xyzw, r0.xyzw
mov o2.xyzw, r8.xyzw
end
endmain:

