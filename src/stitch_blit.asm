// Minecraft - New Nintendo 3DS Edition 
// stitch_blit.shbin



// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aTexCoord.xy , v1 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( texture0 , o1 )

def c4, 0.000000, 0.000000, 0.000000, 0.000000
def c5, 0.500000, 0.500000, 0.000000, 0.000000
def c6, 2.000000, 0.000000, 0.000000, 0.000000

main:
mov r0.xyzw, v0.xyzw
mov r0.z, c4.zzzz
dp4 o0.x, c0.xyzw, r0.xyzw
dp4 o0.y, c1.xyzw, r0.xyzw
dp4 o0.z, c2.xyzw, r0.xyzw
dp4 o0.w, c3.xyzw, r0.xyzw
mov r0.xyzw, v1.xyzw
add r0.xy, -c5.xyyy, r0.xyyy
mul r1.xy, r0.xyyy, v0.zzzz
mul r0.xy, c6.xxxx, r1.xyyy
add o1.xyzw, v1.xyzw, r0.xyzw
end
endmain:
