// Minecraft - New Nintendo 3DS Edition 
// weather.shbin

// Handcoded by ENDERMANYK

// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aColor.xyzw , v1 )
#pragma bind_symbol ( aTexCoord0.xy , v2 )
#pragma bind_symbol ( aTexCoord1.xy , v3 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( color , o1 )
#pragma output_map ( texture0 , o2 )
#pragma output_map ( texture1 , o3 )

def c4, 2.000000, 10.000000, 0.000000, 0.000000

main:
dp4 o0.x, c0.xyzw, v0.xyzw
dp4 o0.y, c1.xyzw, v0.xyzw
dp4 o0.z, c2.xyzw, v0.xyzw
dp4 o0.w, c3.xyzw, v0.xyzw
mov o1.xyzw, v1.xyzw
mov o3.xyzw, v3.xyzw
mul o2.x, c4.xxxx, v2.xxxx
mul o2.y, c4.yyyy, v2.yyyy
end
endmain:

