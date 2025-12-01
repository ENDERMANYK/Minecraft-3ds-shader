// Minecraft - New Nintendo 3DS Edition 
// uv.shbin



// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( texture0 , o1 )

def c19, 1.000000, -1.000000, 1.000000, 1.000000
def c21, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c22, 0.000000, 0.000000, 0.000000, 0.000000
def c51, 0.000000, 0.000000, 0.250000, 0.022346

normalizedepth:
mul r0.z, r0.zzzz, r0.wwww
add r0.z, -c51.zzzz, r0.zzzz
mul r0.z, c51.wwww, r0.zzzz
ret
endnormalizedepth:

main:
dp4 r0.x, c0.xyzw, v0.xyzw
dp4 r0.y, c1.xyzw, v0.xyzw
dp4 r0.z, c2.xyzw, v0.xyzw
dp4 r0.w, c3.xyzw, v0.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c19.xyzw, r0.xyzw
mul r0.xyzw, c21.xyzw, v1.xyzw
slt r1.xyzw, r0.xyzw, c22.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o1.xyzw, r2.xyzw
end
endmain:
