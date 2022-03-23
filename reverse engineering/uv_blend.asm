// Minecraft - New Nintendo 3DS Edition 
// uv_blend.shbin

// Handcoded by ENDERMANYK

/ Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )
#pragma bind_symbol ( bTexCoord.xy , v2 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( texture0 , o1 )
#pragma output_map ( texture1 , o2 )

def c19, 1.000000, -1.000000, 1.000000, 1.000000
def c20, 1.000000, 1.000000, 1.000000, 1.000000
def c21, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c22, 0.000000, 0.000000, 0.000000, 0.000000

main:
mov r0.xyzw, v0.xyzw
mul o0.xyzw, c19.xyzw, r0.xyzw
mul r0.xyzw, c21.xyzw, v1.xyzw
slt r1.xyzw, r0.xyzw, c22.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o1.xyzw, r2.xyzw
mul r0.xyzw, c21.xyzw, v2.xyzw
slt r1.xyzw, r0.xyzw, c22.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o2.xyzw, r2.xyzw
end
endmain: