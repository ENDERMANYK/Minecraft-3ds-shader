// Minecraft - New Nintendo 3DS Edition 
// renderchunk_seasons.shbin

// Handcoded by ENDERMANYK

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

// Booleans
#pragma bind_symbol ( ENABLE_FOG , b1 , b1 )
#pragma bind_symbol ( ALLOW_FADE , b2 , b2 )

// Outputs, varing
#pragma output_map ( position , o0 )
#pragma output_map ( texture0 , o1 )
#pragma output_map ( texture1 , o2 )
#pragma output_map ( texture2 , o3 )
#pragma output_map ( color , o4 )

def c32, 1.000000, -1.000000, 1.000000, 1.000000
def c33, 0.003922, 0.003922, 0.003922, 0.003922
def c34, 0.00001525, 0.00001525, 0.00001525, 0.00001525
def c35, 0.000000, 0.000000, 0.000000, 0.000000
def c36, 1.900000, 1.900000, 1.900000, 1.900000
def c51, 0.000000, 1.000000, 0.025000, 0.022346

normalizedepth:
mul r0.z, r0.zzzz, r0.wwww
add r0.z, -c51.zzzz, r0.zzzz
mul r0.z, c51.wwww, r0.zzzz
ret
endnormalizedepth:

main:
mul r0.xyz, c17.wwww, v0.xyzz
add r1.xyz, c17.xyzz, r0.xyzz
mov r1.w, c32.xxxx
mov r3.xyzw, r1.xyzw
mul r0.xyz, c17.wwww, v0.xyzz
add r1.xyz, c17.xyzz, r0.xyzz
mov r1.w, c32.xxxx
dp4 r2.x, c4.xyzw, r1.xyzw
dp4 r2.y, c5.xyzw, r1.xyzw
dp4 r2.z, c6.xyzw, r1.xyzw
dp4 r2.w, c7.xyzw, r1.xyzw
dp4 r0.x, c8.xyzw, r2.xyzw
dp4 r0.y, c9.xyzw, r2.xyzw
dp4 r0.z, c10.xyzw, r2.xyzw
dp4 r0.w, c11.xyzw, r2.xyzw
mov r0.xyz, r0.yxzz
mul o0.xyzw, c32.xyzw, r0.xyzw
mul r0.xyzw, c34.xyzw, v2.xyzw
slt r1.xyzw, r0.xyzw, c35.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o1.xyzw, r2.xyzw
mul r0.xyzw, c34.xyzw, v3.xyzw
slt r1.xyzw, r0.xyzw, c35.xyzw
add r2.xyzw, r0.xyzw, r1.xyzw
mov o2.xyzw, r2.xyzw
mul r0.xyzw, c33.xyzw, v1.xyzw
mov o3.xyzw, r0.xyzw
mov o4.xyzw, r0.xyzw
end
endmain: