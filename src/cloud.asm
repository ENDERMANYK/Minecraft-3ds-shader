// Minecraft - New Nintendo 3DS Edition 
// cloud.shbin



// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( WORLD , c4 , c7 )
#pragma bind_symbol ( RENDER_DISTANCE , c8 )
#pragma bind_symbol ( FOG_COLOR , c9 )
#pragma bind_symbol ( CURRENT_COLOR , c10 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aColor.xyzw , v1 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( color , o1 )

def c19, 1.000000, -1.000000, 1.000000, 1.000000
def c20, 0.003922, 0.003922, 0.003922, 0.003922
def c21, 0.899994, 0.899994, 0.899994, 0.899994
def c30, 0.000000, 0.000000, 0.000000, 1.000000

length:
mul r15.x, r14.xxxx, r14.xxxx
mad r15.x, v15.yyyy, r14.yyyy, r15.xxxx
mad r15.x, v15.zzzz, r14.zzzz, r15.xxxx
rsq r15.y, r15.xxxx
mul r15.x, r15.xxxx, r15.yyyy
ret
endlength:

main:
dp4 r0.x, c0.xyzw, v0.xyzw
dp4 r0.y, c1.xyzw, v0.xyzw
dp4 r0.z, c2.xyzw, v0.xyzw
dp4 r0.w, c3.xyzw, v0.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c19.xyzw, r0.xyzw
mul r0.xyzw, c20.xyzw, v1.xyzw
mul r1.xyzw, c10.xyzw, r0.xyzw
dp4 r2.x, c4.xyzw, v0.xyzw
dp4 r2.y, c5.xyzw, v0.xyzw
dp4 r2.z, c6.xyzw, v0.xyzw
dp4 r2.w, c7.xyzw, v0.xyzw
mov r14.xyzw, r2.xyzw
call length
mov r3.y, r15.xxxx
rcp r4.x, c8.xxxx
mul r5.x, r3.yyyy, r4.xxxx
add r6.x, -c21.xxxx, r5.xxxx
max r7.x, c30.xxxx, r6.xxxx
add r8.x, c19.xxxx, -r7.xxxx
mul r1.w, r1.wwww, r8.xxxx
mov o1.xyzw, r1.xyzw
end
endmain: