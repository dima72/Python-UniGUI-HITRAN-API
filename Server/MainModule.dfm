object UniMainModule: TUniMainModule
  OldCreateOrder = True
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = UniGUIMainModuleDestroy
  Theme = 'gray'
  MonitoredKeys.Keys = <>
  Height = 589
  Width = 906
  object RemoteDBDatabase1: TRemoteDBDatabase
    Connected = False
    UserName = 'remotedb'
    Password = 'business'
    Left = 155
    Top = 48
  end
  object tbISO: TClientDataSet
    PersistDataPacket.Data = {
      261A00009619E0BD010000001800000007007C000000030000008D0602696402
      000100100000000B6D6F6C6563756C655F696402000100100000000F69736F74
      6F706F6C6F6775655F696402000100100000000869736F5F6E616D6501004900
      10000100055749445448020002001E00096162756E64616E6365080004001000
      0000046D6173730800040010000000086D6F6C5F6E616D650100490010000100
      055749445448020002001E0001000A4348414E47455F4C4F4704008200740100
      0001000000000000000400000002000000000000000400000003000000000000
      0004000000040000000000000004000000050000000000000004000000060000
      0000000000040000000700000000000000040000000800000000000000040000
      000900000000000000040000000A00000000000000040000000B000000000000
      00040000000C00000000000000040000000D00000000000000040000000E0000
      0000000000040000000F00000000000000040000001000000000000000040000
      0011000000000000000400000012000000000000000400000013000000000000
      0004000000140000000000000004000000150000000000000004000000160000
      0000000000040000001700000000000000040000001800000000000000040000
      001900000000000000040000001A00000000000000040000001B000000000000
      00040000001C00000000000000040000001D00000000000000040000001E0000
      0000000000040000001F00000000000000040000002000000000000000040000
      0021000000000000000400000022000000000000000400000023000000000000
      0004000000240000000000000004000000250000000000000004000000260000
      0000000000040000002700000000000000040000002800000000000000040000
      002900000000000000040000002A00000000000000040000002B000000000000
      00040000002C00000000000000040000002D00000000000000040000002E0000
      0000000000040000002F00000000000000040000003000000000000000040000
      0031000000000000000400000032000000000000000400000033000000000000
      0004000000340000000000000004000000350000000000000004000000360000
      0000000000040000003700000000000000040000003800000000000000040000
      003900000000000000040000003A00000000000000040000003B000000000000
      00040000003C00000000000000040000003D00000000000000040000003E0000
      0000000000040000003F00000000000000040000004000000000000000040000
      0041000000000000000400000042000000000000000400000043000000000000
      0004000000440000000000000004000000450000000000000004000000460000
      0000000000040000004700000000000000040000004800000000000000040000
      004900000000000000040000004A00000000000000040000004B000000000000
      00040000004C00000000000000040000004D00000000000000040000004E0000
      0000000000040000004F00000000000000040000005000000000000000040000
      0051000000000000000400000052000000000000000400000053000000000000
      0004000000540000000000000004000000550000000000000004000000560000
      0000000000040000005700000000000000040000005800000000000000040000
      005900000000000000040000005A00000000000000040000005B000000000000
      00040000005C00000000000000040000005D00000000000000040000005E0000
      0000000000040000005F00000000000000040000006000000000000000040000
      0061000000000000000400000062000000000000000400000063000000000000
      0004000000640000000000000004000000650000000000000004000000660000
      0000000000040000006700000000000000040000006800000000000000040000
      006900000000000000040000006A00000000000000040000006B000000000000
      00040000006C00000000000000040000006D00000000000000040000006E0000
      0000000000040000006F00000000000000040000007000000000000000040000
      0071000000000000000400000072000000000000000400000073000000000000
      0004000000740000000000000004000000750000000000000004000000760000
      0000000000040000007700000000000000040000007800000000000000040000
      007900000000000000040000007A00000000000000040000007B000000000000
      00040000007C0000000000000004000000040000010001000100074832283136
      4F29AAD5575705EAEF3F747B4963B40232400348324F04000002000100020007
      48322831384F29AE68528EF261603FFE9E58A7CA0334400348324F0400000300
      010003000748322831374F29315D88D51F61383F87A2409FC80333400348324F
      0400000400010004000748442831364F29D53BA263835C343FF8889812490433
      400348324F0400000500010005000748442831384F291A42FB7C87E7A43EE1B4
      E0455F0535400348324F0400000600010006000748442831374F29EE64C69475
      237F3EADA7565F5D0534400348324F0400008100010007000744322831364F29
      34E3BB8038FB593E7D96E7C1DD0534400348324F0400000700020001000B2831
      3243292831364F2932CFF41263997EEF3FC24CDBBFB2FE454003434F32040000
      0800020002000B28313343292831364F2932CA8D226B0DA5863F5AF0A2AF207F
      464003434F320400000900020003000F2831364F2928313243292831384F2916
      EA9F96D52A703F87DEE2E13DFF464003434F320400000A00020004000F283136
      4F2928313243292831374F298DCF64FF3C0D483F4CE0D6DD3C7F464003434F32
      0400000B00020005000F2831364F2928313343292831384F29CCCD9ACC363F07
      3F1F82AAD1AB7F474003434F320400000C00020006000F2831364F2928313343
      292831374F29FA9CBB5D2F4DE13EE4839ECDAAFF464003434F320400000D0002
      0007000B28313243292831384F2932B49255571E99D03E4C70EA03C9FF474003
      434F320400000E00020008000F2831374F2928313243292831384F290AC1C317
      9AA9B83E1172DEFFC77F474003434F320400007900020009000B283132432928
      31374F2932BC1B8386695C823E766B990CC7FF464003434F320400000F000200
      0A000B28313343292831384F2932EB4FE3A83724683E431CEBE2368048400343
      4F32040000780002000B000F2831384F2928313343292831374F29FCC958077B
      C2513EEA0434113600484003434F320400007A0002000C000B28313343292831
      374F29325150551BFF691A3EDF8AC4043580474003434F320400001000030001
      00062831364F2933624D6551D8C5EF3F23F3C81F0CFE4740024F330400001100
      030002000F2831364F292831364F292831384F29ACB331E15D4F703FE884D041
      97FE4840024F330400001200030003000F2831364F292831384F292831364F29
      ACB331E15D4F603FE884D04197FE4840024F330400001300030004000F283136
      4F292831364F292831374F2956F146E6913F483FAD86C43D967E4840024F3304
      00001400030005000F2831364F292831374F292831364F2956F146E6913F383F
      AD86C43D967E4840024F330400001500040001000B2831344E29322831364F29
      43C9E4D4CEB0EF3F59A2B3CC22004640034E324F0400001600040002000F2831
      344E292831354E292831364F297A3AB24D85D36D3F5B22179CC17F4640034E32
      4F0400001700040003000F2831354E292831344E292831364F297A3AB24D85D3
      6D3F5B22179CC17F4640034E324F0400001800040004000B2831344E29322831
      384F29C27195FE9044603F1E34BBEEAD004740034E324F040000190004000500
      0B2831344E29322831374F29693BA6EECA2E383FB3B112F3AC804640034E324F
      0400001A00050001000A28313243292831364F2952448655BC91EF3FC24CDBBF
      B2FE3B4002434F0400001B00050002000A28313343292831364F298C101E6D1C
      B1863FF3936A9F8EFF3C4002434F0400001C00050003000A2831324329283138
      4F29A120C2099634603F4C70EA03C9FF3D4002434F0400001D00050004000A28
      313243292831374F297B8505F7031E383FD673D2FBC6FF3C4002434F0400001E
      00050005000A28313343292831384F29242CE8C5A24CF73E7CB779E3A4003F40
      02434F0400001F00050006000A28313343292831374F291D2974C18D52D13E06
      BB61DBA2003E4002434F040000200006000100072831324329483400C63368E8
      9FEF3F645DDC4603083040034348340400002100060002000728313343294834
      4182E2C798BB863F94A46B26DF08314003434834040000220006000300082831
      32432948334410CB660E492D443FE86A2BF69709314003434834040000230006
      0004000828313343294833444734FAC321A3D43E18B2BAD5730A324003434834
      040000240007000100062831364F29321D739EB12FD9EF3F8599B67F65FD3F40
      024F320400002500070002000A2831364F292831384F29DF8AA3F64B59703F87
      DEE2E13DFF4040024F320400002600070003000A2831364F292831374F2944A7
      E7DD5850483F4CE0D6DD3C7F4040024F320400002700080001000A2831344E29
      2831364F29B360E28FA2CEEF3F8BC404357CFF3D40024E4F0400002800080002
      000A2831354E292831364F290238AC5F9FEF6D3F8FC4CBD3B9FE3E40024E4F04
      00002900080003000A2831344E292831384F295EB1F126E053603F3A78263449
      004040024E4F0400002A00090001000B28333253292831364F2932A5660FB402
      43EE3FAE7E6C921FFB4F4003534F320400002B00090002000B28333453292831
      364F29320A68226C787AA53FBC22F8DF4A7D504003534F320400002C000A0001
      000B2831344E292831364F29323C17467A51BBEF3FA708707A17FF4640034E4F
      320400002D000B000100072831344E294833429770E82DDEEF3FD3BD4EEACB06
      3140034E48330400002E000B000200072831354E29483332D758784DFE6D3FD7
      BD158909063240034E48330400002F000C0001000C482831344E292831364F29
      339FB0C403CAA6EF3FB43A3943717F4F4004484E4F3304000075000C0002000C
      482831354E292831364F29333FFED2A23EC96D3F57B2632310FF4F4004484E4F
      3304000030000D000100062831364F29488693347F4CEBEF3F1B649291B30031
      40024F4804000031000D000200062831384F2948A6C165FC9862603FA587A1D5
      C9013340024F4804000032000D000300062831364F2944BA1137235A5D243F9F
      71E14048023240024F4804000033000E000100064828313946292AFF5A5EB9FE
      EF3F6B494739980134400248460400006E000E00020006442831394629DAE6C6
      F484251E3F6A960C873303354002484604000034000F0001000748283335436C
      29F8FD9B17273EE83F815CE2C803FD41400348436C04000035000F0002000748
      283337436C29B2101D024702CF3F5915E126A3FC42400348436C0400006B000F
      0003000744283335436C29BFF68A762EEF1E3FADDAA073D17D42400348436C04
      00006C000F0004000744283337436C29AF6931BAB4C8033FAFD17AC8707D4340
      0348436C0400003600100001000748283739427229488AC8B08A37E03F41B797
      3446FB534003484272040000370010000200074828383142722903CFBD874B8E
      DF3F8EAF3DB3247B5440034842720400006F001000030007442837394272299E
      0F976805900E3FE06A1D14AD3B54400348427204000070001000040007442838
      3142722916BEF68004BB0D3F51C6788C8BBB5440034842720400003800110001
      0007482831323749292AFF5A5EB9FEEF3F4ACFF41263FA5F4002484904000071
      00110002000744283132374929DAE6C6F484251E3F18CEEEF6641D6040024849
      0400003900120001000B283335436C292831364F29FF04172B6A30E83F3677F4
      BF5C7B494003436C4F0400003A00120002000B283337436C292831364F29E201
      6553AEF0CE3F0E30F31DFC7A4A4003436C4F0400003B00130001000F2831364F
      29283132432928333253293A1E335019FFED3F4DD87E32C6FB4D40034F435304
      00003C00130002000F2831364F292831324329283334532927DA5548F949A53F
      179F02603CFB4E40034F43530400003D00130003000F2831364F292831334329
      2833325329A9D903ADC090853FE57B4622347C4E40034F43530400003E001300
      04000F2831364F2928313243292833335329A9D903ADC090853FC366800BB27B
      4E40034F43530400003F00130005000F2831384F292831324329283332532921
      020EA14ACD5E3F42EE224C51FC4E40034F43530400004000140001000C483228
      313243292831364F29AC394030478FEF3F747B4963B4023E40044832434F0400
      004100140002000C483228313343292831364F298C101E6D1CB1863FA4C2D842
      90033F40044832434F0400004200140003000C483228313243292831384F29C9
      DF62EA5333603F7F4FAC53E5014040044832434F0400004300150001000C4828
      31364F29283335436C29569A94826E2FE83FE202D0285DFC494004484F436C04
      00004400150002000C482831364F29283337436C29AC730CC85EEFCE3FBABBCE
      86FCFB4A4004484F436C040000450016000100062831344E293235D7C45D18C4
      EF3FF0F78BD992013C40024E320400007600160002000A2831344E292831354E
      29E52B8194D8B57D3F8BC404357CFF3D40024E320400004600170001000B4828
      313243292831344E294BCD1E680586EF3F218FE046CA023B400348434E040000
      4700170002000B4828313343292831344E29B2D7BB3FDEAB863F52D66F26A603
      3C400348434E0400004800170003000B4828313243292831354E29731FCA6141
      AB6D3F268FA7E507023C400348434E0400004900180001000D28313243294833
      283335436C29D751D50451F7E73FDA73999A04FF484005434833436C0400004A
      00180002000D28313243294833283337436C298109DCBA9BA7CE3FB22C98F8A3
      FE494005434833436C0400004B00190001000848322831364F293293DFA293A5
      D6EF3F1B649291B30041400448324F320400004C001A00010008283132432932
      48322A3A92CB7F48EF3FB22E6EA301043A4004433248320400004D001A000200
      0C28313243292831334329483273F4F8BD4D7F963FE275FD82DD043B40044332
      483204000069001A000300082831324329324844F43A3D4A80F5333F363CBD52
      96053B4004433248320400004E001B000100082831324329324836FA9B508880
      43EF3F158C4AEA040C3E4004433248360400006A001B0002000E283132432948
      33283133432948335D2C3AC9BE7A963F46D3D9C9E00C3F400443324836040000
      4F001C0001000728333150294833431B04462CFCEF3F0B2AAA7EA5FF40400350
      483304000050001D0001001028313243292831364F2928313946293252448655
      BC91EF3F512E8D5F787F504004434F463204000077001D000200102831334329
      2831364F2928313946293214573AC4E4B2863F8E739B70AFBF504004434F4632
      0400007E001E0001000B283332532928313946293664062AE3DF67EE3F2CD505
      BCCC3E62400353463604000051001F0001000748322833325329BDFBE3BD6A65
      EE3F454948A46DFE40400348325304000052001F000200074832283334532916
      F6B4C35F93A53F0E10CCD1E3FD41400348325304000053001F00030007483228
      33335329FB07910C39B67E3FEA5BE674597E4140034832530400005400200001
      00114828313243292831364F292831364F2948A13193A8177CEF3F1B649291B3
      0047400548434F4F4804000055002100010007482831364F293258A9A0A2EAD7
      EF3F6FD8B628B37F404003484F32040000560022000100052831364F294A5D32
      8E91ECEF3F8599B67F65FD2F40014F0400005700240001000B2831344E292831
      364F292BB360E28FA2CEEF3F8BC404357CFF3D40034E4F700400005800250001
      000C482831364F2928373942722976711B0DE02DE03F5A48C0E8F2FA57400448
      4F42720400005900250002000C482831364F29283831427229ECC039234A7BDF
      3F06499F56D17A584004484F42720400005A0026000100082831324329324834
      832F4CA60A46EF3F645DDC4603083C4004433248340400005B00260002000E28
      3132432948322831334329483206D847A7AE7C963F94A46B26DF083D40044332
      48340400005C00270001000D283132432948332831364F294822A64412BD8CEF
      3F13D55B035B034040054348334F480400005D00280001000D28313243294833
      2837394272297B832F4CA60AE03FD600A5A1467C57400543483342720400005E
      00280002000D28313243294833283831427229A04FE449D235DF3F527DE71725
      FC57400543483342720400005F00290001001128313243294833283132432928
      31344E2936936FB6B931EF3FEA5E27F56583444005434833434E04000060002A
      0001000B28313243292831394629347FD93D7958A8EF3F1232906797FF554003
      43463404000074002B0001000828313243293448323753211E8997EE3F5917B7
      D10002494004433448320400006D002C0001000C482831324329332831344E29
      C3DE1F4A0FDEEE3F1075BF2365814940044843334E04000067002D0001000248
      32498446B071FDEF3F8E75711B0D20004002483204000073002D000200024844
      F9F34241F668343FB1E1E995B22C084002483204000061002E0001000A283132
      43292833325329AE2CD1596611EE3F8C9E5BE84AFC454002435304000062002E
      0002000A283132432928333453291AF1AEC44D57A53F569929ADBFFB46400243
      5304000063002E0003000A2831334329283332532952F01472A59E853F6C2233
      17B87C464002435304000064002E0004000A2831324329283333532936E6B7E0
      F3607E3F1A89D008367C464002435304000072002F0001000B28333253292831
      364F2933C2C7BB7E1C28EE3F280AF4893CFD534003534F330400007B00300001
      000C2831324329322831344E2932F5EA07686710EF3FC9772975C9004A400443
      324E320400007C00310001001128313243292831364F29283335436C2932CE00
      479DE11FE23F9BFEB50BB07B584005434F436C320400007D0031000200162831
      3243292831364F29283335436C29283337436C2900EB1DE0DC2ED73F1CFA22B6
      7FFB584005434F436C32}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 152
    object tbISOid: TSmallintField
      DisplayWidth = 10
      FieldName = 'id'
    end
    object tbISOmolecule_id: TSmallintField
      DisplayWidth = 10
      FieldName = 'molecule_id'
    end
    object tbISOisotopologue_id: TSmallintField
      DisplayWidth = 12
      FieldName = 'isotopologue_id'
    end
    object tbISOiso_name: TStringField
      DisplayWidth = 18
      FieldName = 'iso_name'
      Size = 30
    end
    object tbISOabundance: TFloatField
      DisplayWidth = 17
      FieldName = 'abundance'
    end
    object tbISOmass: TFloatField
      DisplayWidth = 10
      FieldName = 'mass'
    end
    object tbISOmol_name: TStringField
      DisplayWidth = 21
      FieldName = 'mol_name'
      Size = 30
    end
  end
end
