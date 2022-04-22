declare
@xml2 XML=( SELECT   tds.konuBaslik  konuBaslik
    FROM derSube tds WHERE tds.id=@dersSube_id  )
SELECT T.N.value(' @hafta ', 'nvarchar(max)') hafta, T.N.value(' icerik [1]', 'nvarchar(max)') konuBaslik
FROM @xml2.nodes('/konuBasliklari/baslik') as T(N)

SELECT tds.value('(/konuBasliklari/baslik/ icerik)[1]', 'nvarchar(max)') dersSube tds WHERE tds.id=@dersSube_id
