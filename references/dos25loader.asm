  ;;  end 4051
  * = $4000
          LDA #$01
          STA $CF
          LDA #$00
          STA $0304
          STA $0309
L000C     STA $030A
          STA $030B
          LDA #$50
          STA $0300
          LDA #$01
          STA $0301
          LDA #$3F
          STA $0302
          LDA #$40
          STA $0303
          LDA #$05
          STA $0306
          LDA #$05
          STA $0305
          LDA #$0C
          STA $0308
          JSR $E459
          BPL L003B
          RTS
L003B     LDX #$0B
L003D     LDA $0500,X
          STA $0300,X
          DEX
          BPL L003D
          JSR $E459
          BMI L0051
          JSR $0506
          JMP (L000C)
L0051     RTS
          .BYTE $E2    ;11100010
          .BYTE $02    ;00000010
          .BYTE $E3    ;11100011
          .BYTE $02    ;00000010
          BRK
          RTI
          .END

;auto-generated symbols and labels
 L003B        $3B
 L003D        $3D
 L0051        $51
 L000C        $0C
