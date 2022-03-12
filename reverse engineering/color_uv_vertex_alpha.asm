// Minecraft - New Nintendo 3DS Edition 
// color_uv_vertex_alpha.shbin

// Handcoded by ENDERMANYK

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

def c19, 1.000000, -1.000000, 1.000000, 1.000000
def c20, 0.003922, 0.003922, 0.003922, 0.003922
def c21, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c22, 0.000000, 0.000000, 0.000000, 0.000000

main:
dp4 r0.x, c0.xyzw, v0.xyzw
dp4 r0.y, c1.xyzw, v0.xyzw
dp4 r0.z, c2.xyzw, v0.xyzw
dp4 r0.w, c3.xyzw, v0.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c19.xyzw, r0.xyzw
mul r5.xyzw, c20.xyzw, v2.xyzw
mov r6.xyzw, r5.xyzw
mov o2.xyzw, r6.xyzw
mul r0.xyzw, c21.xyzw, v1.xyzw
slt r1.xyzw, r0.xyzw, c22.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o1.xyzw, r2.xyzw
end
endmain: