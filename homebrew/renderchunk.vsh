; Minecraft - New Nintendo 3DS Edition 
; renderchunk.shbin

; Handcoded by ENDERMANYK
; Updated Source by Cracko298

; Uniforms
.fvec WORLDVIEWPROJ[4]
.fvec WORLDVIEW[4]
.fvec PROJ[4]
.fvec FOG_COLOR
.fvec FOG_CONTROL
.fvec RENDER_DISTANCE
.fvec VIEWPORT_DIMENSION
.fvec CURRENT_COLOR
.fvec CHUNK_ORIGIN_AND_SCALE
.fvec VIEW_POS
.fvec FAR_CHUNKS_DISTANCE

; Inputs, attribute
.in aPosition v0
.in aColor v1
.in aTexCoord v2
.in bTexCoord v3

; Outputs, varing
.out outPos position o0
.out outColor color o1
.out outCoord0 texcoord0 o2
.out outCoord1 texcoord1 o3

; Booleans
.bool ENABLE_FOG
.bool ALLOW_FADE

; Constants
.constf c32(1.000000, -1.000000, 1.000000, 1.000000)
.constf c33(0.003922, 0.003922, 0.003922, 0.003922)
.constf c34(0.00001525, 0.00001525, 0.00001525, 0.00001525)
.constf c35(0.000000, 0.000000, 0.000000, 0.000000)
.constf c36(1.899994, 1.899994, 1.899994, 1.899994)
.constf c37(0.875999, 0.875999, 0.875999, 0.875999)
.constf c38(0.500000, 0.500000, 0.500000, 0.500000)
.constf c39(1.000000, 1.000000, 0.000000, 1.000000)
.constf c40(0.799995, 0.799995, 0.799995, 0.799995)
.constf c41(1.500000, 1.500000, 1.500000, 1.500000)
.constf c42(0.626999, 0.626999, 0.626999, 0.626999)
.constf c51(0.000000, 1.000000, 0.025000, 0.022346)

; normalizedepth
.proc normalizedepth
    mul r0.z, r0.zzzz, r0.wwww
    add r0.z, -c51.zzzz, r0.zzzz
    mul r0.z, c51.wwww, r0.zzzz
.end

; main
.proc main
    mul r0.xyz, CHUNK_ORIGIN_AND_SCALE.wwww, aPosition.xyzz
    add r1.xyz, CHUNK_ORIGIN_AND_SCALE.xyzz, r0.xyzz
    mov r1.w, c32.xxxx
    mov r3, r1
    add r1.xyz, CHUNK_ORIGIN_AND_SCALE.xyzz, r0.xyzz
    mov r1.w, c32.xxxx
    dp4 r2.x, WORLDVIEW[0], r1
    dp4 r2.y, WORLDVIEW[1], r1
    dp4 r2.z, WORLDVIEW[2], r1
    dp4 r2.w, WORLDVIEW[3], r1
    dp4 r0.x, PROJ[0], r2
    dp4 r0.y, PROJ[1], r2
    dp4 r0.z, PROJ[2], r2
    dp4 r0.w, PROJ[3], r2
    mov r0.xyz, r0.yxzz
    mul outPos, c32, r0
    mul r0, c34, aTexCoord
    slti r1, r0, c35
    add r2, r0, r1
    mov outCoord0, r2
    mul r0, c34, bTexCoord
    slti r1, r0, c35
    add r2, r0, r1
    mov r3.xy, r2.xyyy
    mov outCoord1, r2
    mul r0, c33, aColor
    cmp gt, gt, c37, r3.yyyy
    ifc 32, 0, x x=1 y=1
    mul r0.xyz, c40, r0.xyzz
    cmp gt, gt, c42, r0.yyyy
    ifc 36, 0, x x=1 y=1
    add r1, c38, r3.xxxx
    mul r0.xyz, r0.xyzz, r1
    mul r2, c39, r3.xxxx
    mul r4, c41, r2
    add r5, c39.xxxx, -r3.yyyy
    mul r6, r2, r5
    add r0.xyz, r0.xyzz, r6
    mul outColor, c41, r0
    end
    ret
.end
