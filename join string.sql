SELECT *
     , SUBSTRING((SELECT '-' + lgs.ad AS [text()]
         FROM   personel.gorev b
         JOIN personel.gorevSekil lgs ON  lgs.id = b.gorevlendirmeSekil_id
         WHERE   b.gorevDetay_id = sekil.gorevDetay_id
         FOR XML PATH('')
         ),2,100) gorevlendirmeSekli
FROM (SELECT DISTINCT b2.gorevDetay_id
      FROM personel.gorevDetaySekil b2
               JOIN personel.lu_gorevlendirmeSekli lgs2 ON lgs2.id = b2.gorevlendirmeSekil_id) sekil
