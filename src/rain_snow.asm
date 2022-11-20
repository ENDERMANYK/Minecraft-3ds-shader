// Minecraft - New Nintendo 3DS Edition 
// rain_snow.shbin

// Handcoded by ENDERMANYK

// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( POSITION_OFFSET , c4 )
#pragma bind_symbol ( VELOCITY , c5 )
#pragma bind_symbol ( ALPHA , c6 )
#pragma bind_symbol ( VIEW_POSITION , c7 )
#pragma bind_symbol ( SIZE_SCALE , c8 )
#pragma bind_symbol ( LIGHTING , c9 )
#pragma bind_symbol ( FORWARD , c10 )
#pragma bind_symbol ( UV_INFO , c11 )
#pragma bind_symbol ( PARTICLE_BOX , c12 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )
#pragma bind_symbol ( aColor.xyzw , v2 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( texture0 , o1 )
#pragma output_map ( color , o2 )
#pragma output_map ( texture1 , o3 )

def c23, 0.500000, 1.000000, 0.000000, 1.000000
def c30, 0.000000, 0.000000, 0.000000, 1.000000
def c31, 1.000000, -1.000000, 1.000000, 1.000000
def c43, 0.015625, 0.500000, 0.000000, 1.000000

modulo:
rcp r3.x, r5.xxxx
rcp r3.y, r5.yyyy
rcp r3.z, r5.zzzz
mov r3.w, c30.wwww
mul r3.xyzw, r3.xyzw, r4.xyzw
flr r3.xyzw, r3.xyzw
mul r3.xyzw, r3.xyzw, r5.xyzw
add r3.xyzw, r4.xyzw, -r3.xyzw
ret
endmodulo:

main:
mov r0.xyzw, v1.xyzw
mov r0.xy, -r0.xyyy
mul r1.xy, c11.zwww, r0.xyyy
add r1.xy, c11.xyyy, r1.xyyy
mul r0.x, c11.zzzz, v2.xxxx
add r1.x, r1.xxxx, r0.xxxx
mov o1.xyzw, r1.xyzw
mov r0.xyzw, v0.xyzz
add r0.xyz, c4.xyzz, r0.xyzz
mov r4.xyzw, r0.xyzw
mov r5.xyzw, c12.xyzz
call modulo
mov r0.xyz, r3.xyzz
mov r4.xyz, c12.xxxx
mul r1.xyz, c23.xxxx, r4.xyzz
add r0.xyz, r0.xyzz, -r1.xyzz
add r0.xyz, c10.xyzz, r0.xyzz
mov r1.xyz, r0.xyzz
mov r1.w, c23.wwww
mov r2.xyz, c5.xyzz
mul r2.xyz, c8.yyyy, r2.xyzz
add r2.xyz, r2.xyzz, r1.xyzz
mov r2.w, c23.wwww
dp4 r4.x, c0.xyzw, r1.xyzw
dp4 r4.y, c1.xyzw, r1.xyzw
dp4 r4.z, c2.xyzw, r1.xyzw
dp4 r4.w, c3.xyzw, r1.xyzw
dp4 r5.x, c0.xyzw, r2.xyzw
dp4 r5.y, c1.xyzw, r2.xyzw
dp4 r5.z, c2.xyzw, r2.xyzw
dp4 r5.w, c3.xyzw, r2.xyzw
mov r4.xyz, r4.yxzz
mov r5.xyz, r5.yxzz
mul r4.xyzw, c31.xyzw, r4.xyzw
mul r5.xyzw, c31.xyzw, r5.xyzw
rcp r6.w, r4.wwww
mul r6.xy, r4.xyyy, r6.wwww
rcp r7.w, r5.wwww
mul r7.xy, r5.xyyy, r7.wwww
add r6.xy, r7.xyyy, -r6.xyyy
mov r7.xy, r6.xyyy
mov r6.x, -r7.yyyy
mov r6.y, r7.xxxx
dp4 r7.x, r6.xyyy, r6.xyyy
rsq r7.x, r7.xxxx
mul r7.xy, r6.xyyy, r7.xxxx
add r6.xyzw, r5.xyzw, -r4.xyzw
mad r6.xyzw, v0.xyzw, v1.yyyy, r4.xyzw
mul r7.xy, c8.xxxx, r7.xyyy
mov r9.xyzw, v1.xyzw
add r8.x, c23.xxxx, -r9.xxxx
mul r8.xy, r7.xyyy, r8.xxxx
add r6.xy, r6.xyyy, r8.xyyy
mov o0.xyzw, r6.xyzw
mov o2.xyzw, c6.xyzw
mul r1.xz, c43.xxxx, r1.xzzz
add r1.xz, c43.yyyy, r1.xzzz
mov o3.xyzw, r1.xzzz
end
endmain: