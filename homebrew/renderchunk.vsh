; Minecraft - New Nintendo 3DS Edition 
; renderchunk.shbin

; Handcoded by ENDERMANYK

; Uniforms
.fvec WORLDVIEWPROJ[4], WORLDVIEW[4], PROJ[4]
.fvec FOG_COLOR
.fvec FOG_CONTROL
.fvec RENDER_DISTANCE
.fvec VIEWPORT_DIMENSION
.fvec CHUNK_ORIGIN_AND_SCALE
.fvec VIEW_POS
.fvec FAR_CHUNKS_DISTANCE
.fvec GLINT_UV_SCALE

; Inputs
.in aPosition  v0
.in aColor     v1
.in aTexCoord  v2
.in bTexCoord  v3

; Outputs
.out outPos position.xyzw
.out outColor color.rgba
.out outCoord0 texcoord0.xy
.out outCoord1 texcoord1.xy

; Booleans
.bool ENABLE_FOG
.bool ALLOW_FADE

; Constants
.constf const0(1.000000, -1.000000, 1.000000, 1.000000)
.constf const1(0.003922, 0.003922, 0.003922, 0.003922)
.constf const2(0.00001525, 0.00001525, 0.00001525, 0.00001525)
.constf const3(0.000000, 0.000000, 0.000000, 0.000000)
.constf const4(0.000000, 1.000000, 0.025000, 0.022346)
.constf const5(0.500000, 0.500000, 0.500000, 0.500000)

; normalizedepth
.proc normalizedepth
    mul r0.z, r0.zzzz, r0.wwww
    add r0.z, -const4.zzzz, r0.zzzz
    mul r0.z, const4.wwww, r0.zzzz
.end

; main
.proc main
    mul r0.xyz, CHUNK_ORIGIN_AND_SCALE.wwww, aPosition.xyzz
    add r1.xyz, CHUNK_ORIGIN_AND_SCALE.xyzz, r0.xyzz
    mov r1.w, const0.xxxx
    mov r3, r1
    add r1.xyz, CHUNK_ORIGIN_AND_SCALE.xyzz, r0.xyzz
    mov r1.w, const0.xxxx
    dp4 r2.x, WORLDVIEW[0], r1
    dp4 r2.y, WORLDVIEW[1], r1
    dp4 r2.z, WORLDVIEW[2], r1
    dp4 r2.w, WORLDVIEW[3], r1
    dp4 r0.x, PROJ[0], r2
    dp4 r0.y, PROJ[1], r2
    dp4 r0.z, PROJ[2], r2
    dp4 r0.w, PROJ[3], r2
    mov r0.xyz, r0.yxzz
    mul outPos, const0, r0
    ;mul aColor, const5, aColor
    mul outColor, const1, aColor
    mul aColor, const5, aColor
    mul r0, const2, aTexCoord
    slti r1, r0, const3
    add r2, r0, r1
    mov outCoord0, r2
    mul r0, const2, bTexCoord
    slti r1, r0, const3
    add r2, r0, r1
    mov outCoord1, r2
    end
.end