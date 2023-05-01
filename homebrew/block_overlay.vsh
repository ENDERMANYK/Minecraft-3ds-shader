; Minecraft - New Nintendo 3DS Edition 
; block_overlay.shbin

; Handcoded by ENDERMANYK

; Uniforms
.fvec WORLDVIEWPROJ[4]
.fvec CURRENT_COLOR

; Inputs
.in aPosition  v0
.in aTexCoord  v1
.in bTexCoord  v2

; Outputs
.out outPos position.xyzw
.out outCoord0 texcoord0.xyzw
.out outColor color.rgba

; Constants
.constf const0(1.000000, -1.000000, 1.000000, 1.000000)
.constf const1(0.000015, 0.000015, 0.000015, 0.000015)
.constf const2(0.000000, 0.000000, 0.000000, 0.000000)
.constf const3(0.000000, 0.000000, 0.250000, 0.022346)

; normalizedepth
.proc normalizedepth
    mul r0.z, r0.z, r0.w
    add r0.z, -const3.z, r0.z
    mul r0.z, const3.w, r0.z
.end

; main
.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxz
    mul outPos, const0, r0
    mul r0, const1, aTexCoord
    slt r1, r0, const2
    add r2, r0, r1
    mov outCoord0, r2
    mov outColor, CURRENT_COLOR
    end
.end
