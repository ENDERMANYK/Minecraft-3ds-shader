; Minecraft - New Nintendo 3DS Edition 
; cloud.shbin

; Handcoded by ENDERMANYK

; Uniforms
.fvec WORLDVIEWPROJ[4], WORLD[4]
.fvec RENDER_DISTANCE
.fvec FOG_COLOR
.fvec CURRENT_COLOR

; Inputs
.in aPosition v0
.in aColor    v1

; Outputs
.out outPos position.xyzw
.out outColor color.rgba

; Constants
.constf const0(1.000000, -1.000000, 1.000000, 1.000000)
.constf const1(0.003922, 0.003922, 0.003922, 0.003922)
.constf const2(0.899994, 0.899994, 0.899994, 0.899994)
.constf const3(0.000000, 0.000000, 0.000000, 1.000000)

; length
.proc length
    mul r15.x, r14.x, r14.x
    mad r15.x, r14.y, r14.y, r15.x
    mad r15.x, r14.z, r14.z, r15.x
    rsq r15.y, r15.x
    mul r15.x, r15.x, r15.y
.end

; main
.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxz
    mul outPos, const0, r0
    mul r0, const1, aColor
    mul r1, CURRENT_COLOR, r0
    dp4 r2.x, WORLD[0], aPosition
    dp4 r2.y, WORLD[1], aPosition
    dp4 r2.z, WORLD[2], aPosition
    dp4 r2.w, WORLD[3], aPosition
    mov r14, r2
    call length
    mov r3.y, r15.x
    rcp r4.x, RENDER_DISTANCE.x
    mul r5.x, r3.y, r4.x
    add r6.x, -const2.x, r5.x
    max r7.x, const3.x, r6.x
    add r8.x, const0.x, -r7.x
    mul r1.w, r1.w, r8.x
    mov outColor, r1
    end
.end

