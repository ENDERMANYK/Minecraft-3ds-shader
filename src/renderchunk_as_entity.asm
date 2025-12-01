// Minecraft - New Nintendo 3DS Edition 
// renderchunk_as_entity.shbin



// Uniforms
#pragma bind_symbol ( WORLDVIEWPROJ , c0 , c3 )
#pragma bind_symbol ( WORLDVIEW , c4 , c7 )
#pragma bind_symbol ( PROJ , c8 , c11 )
#pragma bind_symbol ( FOG_COLOR , c12 )
#pragma bind_symbol ( FOG_CONTROL , c13 )
#pragma bind_symbol ( RENDER_DISTANCE , c14 )
#pragma bind_symbol ( VIEWPORT_DIMENSION , c15 )
#pragma bind_symbol ( CURRENT_COLOR , c16 )
#pragma bind_symbol ( CHUNK_ORIGIN_AND_SCALE , c17 )
#pragma bind_symbol ( VIEW_POS , c18 )
#pragma bind_symbol ( FAR_CHUNKS_DISTANCE , c19 )

// Inputs, attribute
#pragma bind_symbol ( aPosition.xyz , v0 )
#pragma bind_symbol ( aColor.xyzw , v1 )
#pragma bind_symbol ( aTexCoord.xy , v2 )
#pragma bind_symbol ( bTexCoord.xy , v3 )
#pragma bind_symbol ( aNormal.xy , v4 )

// Booleans
#pragma bind_symbol ( ENABLE_FOG , b1 , b1 )
#pragma bind_symbol ( ALLOW_FADE , b2 , b2 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( color , o1 )
#pragma output_map ( texture0 , o2 )
#pragma output_map ( texture1 , o3 )

def c32, 1.000000, -1.000000, 1.000000, 1.000000
def c33, 0.003922, 0.003922, 0.003922, 0.003922
def c34, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c35, 0.000000, 0.000000, 0.000000, 0.000000

main:
dp4 r0.x, c0.xyzw, v0.xyzw
dp4 r0.y, c1.xyzw, v0.xyzw
dp4 r0.z, c2.xyzw, v0.xyzw
dp4 r0.w, c3.xyzw, v0.xyzw
mov r3.xyzw, r0.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c32.xyzw, r0.xyzw
mul o1.xyzw, c33.xyzw, v1.xyzw
mul r0.xyzw, c34.xyzw, v2.xyzw
slt r1.xyzw, r0.xyzw, c35.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o2.xyzw, r2.xyzw
mul r0.xyzw, c34.xyzw, v3.xyzw
slt r1.xyzw, r0.xyzw, c35.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o3.xyzw, r2.xyzw
end
endmain:
