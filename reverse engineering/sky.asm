// Minecraft - New Nintendo 3DS Edition 
// sky.shbin

// Handcoded by ENDERMANYK

// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( CURRENT_COLOR , c4 )
#pragma bind_symbol ( FOG_COLOR , c5 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aColor.xyzw , v1 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( color , o1 )

def c19, 1.000000, -1.000000, 1.000000, 1.000000
def c20, 0.003922, 0.003922, 0.003922, 0.003922

main:
dp4 r0.x, c0.xyzw, v0.xyzw
dp4 r0.y, c1.xyzw, v0.xyzw
dp4 r0.z, c2.xyzw, v0.xyzw
dp4 r0.w, c3.xyzw, v0.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c19.xyzw, r0.xyzw
mul r0.xyzw, c20.xyzw, v1.xyzw
mov r1.xyzw, c5.xyzw
add r2.xyzw, -c4.xyzw, r1.xyzw
mad r2.xyzw, v0.xyzw, r0.xxxx, c4.xyzw
mov o1.xyzw, r2.xyzw
end
endmain: