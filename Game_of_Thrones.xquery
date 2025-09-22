declare namespace functx = "http://www.functx.com";
declare function functx:word-count
  ( $arg as xs:string? )  as xs:integer {

   count(tokenize($arg, '\W+')[. != ''])
 } ;


<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <fo:layout-master-set>
        <fo:simple-page-master master-name="A4" page-height="210mm" page-width="297mm">
            <fo:region-body margin="0mm 0mm 5mm 0mm" background-image="Bilder/schattenwolf.png" background-repeat="repeat"></fo:region-body>
            <fo:region-after region-name="footer" background-color="silver" extent="7mm" display-align="after"></fo:region-after>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="A5" page-height="148mm" page-width="210mm">
            <fo:region-body margin="0mm 0mm 0mm 0mm" background-image="Bilder/drache.gif" background-repeat="repeat"></fo:region-body>
            <fo:region-before region-name="header" background-color="white" extent="5mm" display-align="inherit"></fo:region-before>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="A4_2" page-height="210mm" page-width="297mm">
            <fo:region-body margin="5mm 5mm 5mm 5mm" column-count="3" column-gap="20mm"></fo:region-body>
            <fo:region-after region-name="second_footer" background-color="black" extent="5mm" display-align="inherit"></fo:region-after>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="A5_2" page-height="148mm" page-width="210mm">
            <fo:region-body margin="0mm 0mm 5mm 0mm" column-count="2" column-gap="50mm" background-color="silver"></fo:region-body>
            <fo:region-after region-name="third_footer" background-color="maroon" extent="5mm" display-align="inherit"></fo:region-after>
        </fo:simple-page-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="A4">
    <fo:static-content flow-name="footer">
            <fo:block font-weight="bold" color="olive" text-align="center" word-spacing="5mm" font-size="105%">„I will do what queens do. I will rule!“ <fo:inline font-style="italic" word-spacing="1mm">Daenerys Targaryen</fo:inline></fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
        <fo:block font-family="Liberation Serif" color="olive" font-size="300%" font-weight="bold" text-align="left">Figurenübersicht</fo:block>
            <fo:block font-family="Liberation Serif">
                <fo:table border-style="rigde" border-width="5pt">
                    <fo:table-header text-align="center" font-size="150%" font-weight="bold">
                        <fo:table-row>
                            <fo:table-cell width="50mm">
                                <fo:block background-color="olive">Name</fo:block>
                            </fo:table-cell>
                            <fo:table-cell width="70mm">
                                <fo:block background-color="silver">Zugehörigkeit</fo:block>
                            </fo:table-cell>
                            <fo:table-cell width="130mm">
                                <fo:block background-color="olive">Tot oder lebendig?</fo:block>
                            </fo:table-cell>
                         </fo:table-row>
                     </fo:table-header>
                     <fo:table-body text-align="center" linefeed-treatment="preserve">
                         <fo:table-row>
                            <fo:table-cell width="50mm" border-style="solid" border-width="1pt">
                                <fo:block background-color="silver">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name
                                            order by $name
                                            return (string($name),"&#xA;&#xA;")
                                            }
                                </fo:block>
                             </fo:table-cell>
                             <fo:table-cell width="70mm" border-style="solid" border-width="1pt">
                                <fo:block background-color="olive">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $membership := $charakter/Fraktion
                                            order by $name
                                            return (string($membership),"&#xA;&#xA;")
                                            }
                                </fo:block>
                             </fo:table-cell>
                             <fo:table-cell width="130mm" border-style="solid" border-width="1pt">
                                <fo:block background-color="silver">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $status := $charakter/Status/@status,
                                            $cause_of_death := $charakter/Status/Todesursache
                                            order by $name
                                            return (if($status = "verstorben")
                                                   then string($cause_of_death)
                                                   else "entweder am Leben oder nicht mehr erwähnt","&#xA;&#xA;")
                                            }
                                </fo:block>
                             </fo:table-cell>
                         </fo:table-row>
                     </fo:table-body>
                </fo:table>
            </fo:block>
            <fo:block margin-top="-36mm" margin-left="180mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/daenerys_targaryen.png" content-width="602px" content-height="441px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
            <fo:block font-family="Liberation Serif" font-size="120%" font-weight="bold" margin-top="-30mm" margin-left="30mm">Mehr Informationen zu den Figuren gibt es 
                <fo:inline text-decoration="underline" font-style="italic">
                    <fo:basic-link external-destination="url('http://de.gameofthrones.wikia.com/wiki/Kategorie:Charaktere')">hier</fo:basic-link>
                </fo:inline>!
            </fo:block>
            </fo:flow>
    </fo:page-sequence>
    <fo:page-sequence master-reference="A5">
    <fo:static-content flow-name="header">
            <fo:block font-weight="bold" color="red" font-size="85%" text-align="center">„There is only one god and his name is Death. And there is only one thing we say to Death: Not today.“   <fo:inline font-style="italic">Syrio Forel</fo:inline></fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
            <fo:block font-family="Liberation Serif" color="red" font-size="180%" letter-spacing="1mm" font-weight="bold" text-align="center" margin-top="5mm" background-color="white">Religionszugehörigkeiten</fo:block>
             <fo:block font-family="Liberation Serif">
                 <fo:table border-style="rigde" border-width="5pt">
                    <fo:table-header background-color="red" font-size="130%">
                        <fo:table-row>
                            <fo:table-cell width="70mm">
                                <fo:block>Die alten Götter des Waldes</fo:block>
                            </fo:table-cell>
                            <fo:table-cell width="70mm">
                                <fo:block>Der ertrunkene Gott</fo:block>
                            </fo:table-cell>
                            <fo:table-cell width="70mm">
                                <fo:block>Glaube an die Sieben</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body background-color="white" linefeed-treatment="preserve">
                        <fo:table-row>
                            <fo:table-cell border-width="1pt" width="70mm" border-style="solid" text-align="right">
                                <fo:block>{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $religion := $charakter/Religion
                                            order by $name
                                            return if($religion = "Die alten Götter des Waldes")
                                                   then (upper-case($name),"&#xA;")
                                                   else None
                                            }
                                </fo:block>
                             </fo:table-cell>
                             <fo:table-cell border-width="1pt" width="70mm" border-style="solid" text-align="right">
                                <fo:block>{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $religion := $charakter/Religion
                                            order by $name
                                            return if($religion = "Der ertrunkene Gott")
                                                   then (upper-case($name),"&#xA;")
                                                   else None
                                            }
                                </fo:block>
                             </fo:table-cell>
                             <fo:table-cell border-width="1pt" width="70mm" border-style="solid" text-align="right">
                                <fo:block>{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $religion := $charakter/Religion
                                            order by $name
                                            return if($religion = "Glaube an die Sieben")
                                                   then (upper-case($name),"&#xA;")
                                                   else None
                                            }
                                </fo:block>
                             </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                 </fo:table>
             </fo:block>
              <fo:block font-family="Liberation Serif">
                 <fo:table border-style="rigde" border-width="5pt">
                    <fo:table-header border-style="solid" border-width="1pt" background-color="red" font-size="130%">
                        <fo:table-row>
                            <fo:table-cell width="70mm" >
                                <fo:block>Herr des Lichts</fo:block>
                            </fo:table-cell>
                            <fo:table-cell width="70mm">
                                <fo:block>Gott des Todes</fo:block>
                            </fo:table-cell>
                            <fo:table-cell width="70mm">
                                <fo:block>Vielgesichtiger Gott</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body background-color="white" linefeed-treatment="preserve">
                        <fo:table-row>
                            <fo:table-cell width="70mm" border-width="1pt" border-style="solid" text-align="right">
                                <fo:block>{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $religion := $charakter/Religion
                                            order by $name
                                            return if($religion = "Herr des Lichts")
                                                   then (upper-case($name),"&#xA;")
                                                   else None
                                            }
                                </fo:block>
                             </fo:table-cell>
                              <fo:table-cell width="70mm" border-width="1pt" border-style="solid" text-align="right">
                                <fo:block>{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $religion := $charakter/Religion
                                            order by $name
                                            return if($religion = "Gott des Todes")
                                                   then (upper-case($name),"&#xA;")
                                                   else None
                                            }
                                </fo:block>
                             </fo:table-cell>
                              <fo:table-cell width="70mm" border-width="1pt" border-style="solid" text-align="right">
                                <fo:block>{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $religion := $charakter/Religion
                                            order by $name
                                            return if($religion = "Vielgesichtiger Gott")
                                                   then (upper-case($name),"&#xA;")
                                                   else None
                                            }
                                </fo:block>
                             </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                 </fo:table>
              </fo:block>
        </fo:flow>
    </fo:page-sequence>
    <fo:page-sequence master-reference="A4_2">
    <fo:static-content flow-name="second_footer">
            <fo:block font-weight="bold" text-align="center" color="gold" word-spacing="5mm">„When you play the game of thrones you win or you die.“ <fo:inline font-style="italic"  word-spacing="1mm">Cersei Lennister</fo:inline></fo:block>
        </fo:static-content>
         <fo:flow flow-name="xsl-region-body">
         <fo:block font-family="Liberation Serif" color="gold" font-size="180%" font-weight="bold" text-align="center" background-color="black">Letzte Folge, in der die Figur vorkam</fo:block>
            <fo:block>
                <fo:list-block provisional-distance-between-starts="20mm" provisional-label-separation="20mm" font-family="Liberation-Serif" linefeed-treatment="preserve">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block font-weight="bold" margin-top="10mm" font-size="95%">vor Beginn der Serie gestorben:</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block font-size="120%" background-color="gold" margin-top="10mm" text-align="center">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $last_episode := $charakter/Status/letzte_Folge,
                                            $status := $charakter/Status/@status
                                            order by string($name)
                                            return if($last_episode = "0" and $status="verstorben")
                                                   then (string($name), "&#xA;")
                                                   else None
                                            }
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
            </fo:block>
            <fo:block>
                 <fo:list-block provisional-distance-between-starts="20mm" provisional-label-separation="20mm" font-family="Liberation-Serif" linefeed-treatment="preserve">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block font-weight="bold" margin-top="40mm" font-size="95%">in der letzten Folge noch am Leben:</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block font-size="120%" background-color="gold" margin-top="10mm" text-align="center">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $last_episode := $charakter/Status/letzte_Folge,
                                            $status := $charakter/Status/@status
                                            order by string($name)
                                            return if($last_episode = "67" and $status="am Leben")
                                                   then (string($name), "&#xA;")
                                                   else None
                                            }
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
           </fo:block>
           <fo:block>
                 <fo:list-block provisional-distance-between-starts="20mm" provisional-label-separation="20mm" font-family="Liberation-Serif" linefeed-treatment="preserve">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block font-weight="bold" margin-top="20mm" font-size="95%">nur in der ersten Staffel dabei:</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block font-size="120%" background-color="gold" text-align="center">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $last_episode := $charakter/Status/letzte_Folge
                                            order by string($name) 
                                            return if($last_episode < 11 and $last_episode > 0)
                                                   then (string($name), "&#xA;")
                                                   else None
                                            }
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
           </fo:block>
           <fo:block>
                 <fo:list-block provisional-distance-between-starts="20mm" provisional-label-separation="20mm" font-family="Liberation-Serif" linefeed-treatment="preserve">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block font-weight="bold" margin-top="35mm" font-size="95%">in Staffel drei bis fünf gestorben:</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block font-size="120%" background-color="gold" margin-top="10mm" text-align="center">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $last_episode := $charakter/Status/letzte_Folge,
                                            $status := $charakter/Status/@status
                                            order by string($name) 
                                            return if($last_episode < 51 and $last_episode > 20 and $status="verstorben")
                                                   then (string($name), "&#xA;")
                                                   else None
                                            }
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
           </fo:block>
           <fo:block>
                 <fo:list-block provisional-distance-between-starts="20mm" provisional-label-separation="20mm" font-family="Liberation-Serif" linefeed-treatment="preserve">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block font-weight="bold" margin-top="12mm" font-size="95%">in Staffel zwei gestorben:</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                            <fo:block font-size="120%" background-color="gold" margin-top="10mm" text-align="center">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $last_episode := $charakter/Status/letzte_Folge,
                                            $status := $charakter/Status/@status
                                            order by string($name) 
                                            return if($last_episode < 21 and $last_episode > 10 and $status="verstorben")
                                                   then (string($name), "&#xA;")
                                                   else None
                                            }
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </fo:list-block>
           </fo:block>
           <fo:block margin-top="30mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/hirsch.png" content-width="380px" content-height="331px"></fo:external-graphic>
                </fo:inline>
            </fo:block>
         </fo:flow>
    </fo:page-sequence>
    <fo:page-sequence master-reference="A5_2">
        <fo:static-content flow-name="third_footer">
            <fo:block font-weight="bold" text-align="center" color="gold" word-spacing="5mm">„Chaos isn’t a pit. Chaos is a ladder.“ <fo:inline font-style="italic" word-spacing="1mm">Petyr Baelish</fo:inline></fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-left="5mm" color="maroon">Welche Figuren kommen aus Königsmund?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" margin-left="5mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $origin := $charakter/Herkunft
                                            order by string($name) 
                                            return if($origin="Königsmund")
                                                   then (string($name), "&#xA;")
                                                   else None
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-left="5mm" color="maroon">Wer ist ein Ritter?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" margin-left="5mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $vocation := $charakter/Tätigkeit
                                            order by string($name) 
                                            return if($vocation="Ritter")
                                                   then (string($name), "&#xA;")
                                                   else None
                                            }
                            </fo:block>
        <fo:block margin-top="0mm" margin-left="-60mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/jon_snow.png" content-width="313px" content-height="1001px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-141mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" color="maroon" margin-right="5mm">Wer wurde von Jon Snow getötet?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" margin-right="5mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $cause_of_death := $charakter/Status/Todesursache,
                                            $murdered_by_Jon_Snow := matches($cause_of_death, 'Jon Snow')
                                            order by string($name) 
                                            return if(string($murdered_by_Jon_Snow) ="true")
                                                   then (string($name), "&#xA;")
                                                   else None
                                               
                                            }
                            </fo:block>
        <fo:block margin-top="35mm" margin-left="25mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/löwe.png" content-width="280px" content-height="231px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        </fo:flow>
    </fo:page-sequence>
    <fo:page-sequence master-reference="A5_2">
        <fo:static-content flow-name="third_footer">
            <fo:block font-weight="bold" text-align="center" color="gold" word-spacing="5mm">„Chaos isn’t a pit. Chaos is a ladder.“ <fo:inline font-style="italic" word-spacing="1mm">Petyr Baelish</fo:inline></fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
         <fo:block margin-top="25mm" margin-left="70mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/lannister.png" content-width="400px" content-height="395px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-108mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" color="maroon" margin-left="5mm">Wer ist das Oberhaupt eines Hauses?</fo:block>
        <fo:block font-size="95%" margin-top="1mm" margin-left="5mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" text-align="justify" margin-right="5mm">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $vocation := $charakter/Tätigkeit,
                                            $heads := matches($vocation, 'Oberhaupt')
                                            order by string($vocation) 
                                            return if(string($heads) ="true")
                                                   then (upper-case($name), "ist", string($vocation), "&#xA;")
                                                   else None
                                               
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-left="5mm" color="maroon">Wie viele Krieger gibt es?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" margin-left="5mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" text-align="center">{count(for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $vocation := $charakter/Tätigkeit,
                                            $warrior := matches($vocation, 'Krieger')
                                            return if (string($warrior) = 'true')
                                                   then functx:word-count(string($warrior))
                                                   else None)
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" color="maroon" margin-right="5mm" margin-left="5mm">Welche Nummer hat die vorerst letzte Folge?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" margin-right="5mm" text-align="center">{max(for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $last_episode := $charakter/Status/letzte_Folge
                                            return $last_episode)                                      
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-right="5mm" color="maroon" margin-left="5mm">Wie viele Figuren sind in der ersten Staffel gestorben?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" margin-right="5mm" text-align="center">{count(for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $last_episode := $charakter/Status/letzte_Folge,
                                            $status := $charakter/Status/@status
                                            return if($last_episode < 11 and $last_episode > 0 and $status="verstorben")
                                                   then functx:word-count(string($name))
                                                   else None)
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-right="5mm" color="maroon" margin-left="5mm">Wie viele Figuren sind in der letzten Folge noch am Leben?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" margin-right="5mm" text-align="center">{count(for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $last_episode := $charakter/Status/letzte_Folge,
                                            $status := $charakter/Status/@status
                                            return if($last_episode = "67" and $status="am Leben")
                                                   then functx:word-count(string($name))
                                                   else None)
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-right="5mm" color="maroon" margin-left="12mm">Wie viele Figuren sind insgesamt gestorben?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" margin-right="5mm" text-align="center">{count(for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $status := $charakter/Status/@status
                                            return if($status="verstorben")
                                                   then functx:word-count(string($status))
                                                   else None)
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-right="5mm" color="maroon" margin-left="5mm">Wie viele Figuren kommen aus Winterfell?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" margin-right="5mm" text-align="center">{count(for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $origin := $charakter/Herkunft
                                            return if($origin="Winterfell")
                                                   then functx:word-count(string($origin))
                                                   else None)
                                            }
                            </fo:block>
        <fo:block margin-top="2mm" font-family="Liberation Serif" font-size="130%" font-weight="bold" margin-right="5mm" color="maroon" margin-left="5mm">Wie viele Nachtwächter gibt es?</fo:block>
        <fo:block font-size="120%" margin-top="1mm" font-family="Liberation Serif" linefeed-treatment="preserve" font-weight="bold" margin-right="5mm" text-align="center">{count(for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $vocation := $charakter/Tätigkeit,
                                            $night_watchman := matches($vocation, 'Nachtwächter')
                                            return if (string($night_watchman) = 'true')
                                                   then functx:word-count(string($night_watchman))
                                                   else None)
                                            }
                            </fo:block>
        </fo:flow>
    </fo:page-sequence>
    <fo:page-sequence master-reference="A4_2">
    <fo:static-content flow-name="second_footer">
            <fo:block font-weight="bold" text-align="center" color="white" word-spacing="5mm">„When you play the game of thrones you win or you die.“ <fo:inline font-style="italic"  word-spacing="1mm">Cersei Lennister</fo:inline></fo:block>
    </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
            <fo:block font-family="Liberation Serif" color="blue" font-size="220%" font-weight="bold" text-align="center" letter-spacing="2mm">Steckbriefe</fo:block>
            <fo:block margin-top="-5mm" margin-left="5mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/cersei_lannister.png" content-width="340px" content-height="808px"></fo:external-graphic>
                </fo:inline>
            </fo:block>
            <fo:block font-size="110%" background-color="blue" text-align="left" color="white" linefeed-treatment="preserve" margin-top="0mm" padding="4mm">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $origin := $charakter/Herkunft,
                                            $membership := $charakter/Fraktion,
                                            $religion := $charakter/Religion,
                                            $vocation := $charakter/Tätigkeit,
                                            $status := $charakter/Status/@status,
                                            $cause_of_death := $charakter/Status/Todesursache
                                            where $name = "Cersei Lennister"
                                            return if ($status = "am Leben" or $status = "unbekannt")
                                            then ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status))
                                            else ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status), "&#xA;&#xA;",
                                            "Todesursache:", string($cause_of_death))
                                            }
                              </fo:block>
        <fo:block font-size="110%" background-color="blue" text-align="left" color="white" linefeed-treatment="preserve" padding="4mm" margin-top="14mm">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $origin := $charakter/Herkunft,
                                            $membership := $charakter/Fraktion,
                                            $religion := $charakter/Religion,
                                            $vocation := $charakter/Tätigkeit,
                                            $status := $charakter/Status/@status,
                                            $cause_of_death := $charakter/Status/Todesursache
                                            where $name = "Arya Stark"
                                            return if ($status = "am Leben" or $status = "unbekannt")
                                            then ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status))
                                            else ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status), "&#xA;&#xA;",
                                            "Todesursache:", string($cause_of_death))
                                            }
                              </fo:block>
        <fo:block margin-top="22mm" margin-left="-8mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/arya_stark.png" content-width="501px" content-height="442px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-5mm" margin-left="0mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/stannis_baratheon.png" content-width="340px" content-height="538px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block font-size="110%" background-color="blue" text-align="left" color="white" linefeed-treatment="preserve" padding="4mm" margin-top="0mm">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $origin := $charakter/Herkunft,
                                            $membership := $charakter/Fraktion,
                                            $religion := $charakter/Religion,
                                            $vocation := $charakter/Tätigkeit,
                                            $status := $charakter/Status/@status,
                                            $cause_of_death := $charakter/Status/Todesursache
                                            where $name = "Stannis Baratheon"
                                            return if ($status = "am Leben" or $status = "unbekannt")
                                            then ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status))
                                            else ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status), "&#xA;&#xA;",
                                            "Todesursache:", string($cause_of_death))
                                            }
                              </fo:block>
        <fo:block font-size="110%" background-color="blue" text-align="left" color="white" linefeed-treatment="preserve" padding="4mm" margin-top="2mm">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $origin := $charakter/Herkunft,
                                            $membership := $charakter/Fraktion,
                                            $religion := $charakter/Religion,
                                            $vocation := $charakter/Tätigkeit,
                                            $status := $charakter/Status/@status,
                                            $cause_of_death := $charakter/Status/Todesursache
                                            where $name = "Tyrion Lennister"
                                            return if ($status = "am Leben" or $status = "unbekannt")
                                            then ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status))
                                            else ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status), "&#xA;&#xA;",
                                            "Todesursache:", string($cause_of_death))
                                            }
                              </fo:block>
        <fo:block margin-top="-1mm" margin-left="0mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/tyrion_lannister.png" content-width="262px" content-height="1019px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-5mm" margin-left="0mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/jorah_mormont.png" content-width="239px" content-height="814px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block font-size="110%" background-color="blue" text-align="left" color="white" linefeed-treatment="preserve" padding="4mm" margin-top="-2mm">{for $charakter in doc("Charaktere.xml")/Game_of_Thrones/Charakter
                                            let $name := $charakter/@name,
                                            $origin := $charakter/Herkunft,
                                            $membership := $charakter/Fraktion,
                                            $religion := $charakter/Religion,
                                            $vocation := $charakter/Tätigkeit,
                                            $status := $charakter/Status/@status,
                                            $cause_of_death := $charakter/Status/Todesursache
                                            where $name = "Jorah Mormont"
                                            return if ($status = "am Leben" or $status = "unbekannt")
                                            then ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status))
                                            else ("Name:", upper-case($name), "&#xA;&#xA;",
                                            "Herkunft:", string($origin), "&#xA;&#xA;",
                                            "Haus:", string($membership), "&#xA;&#xA;",
                                            "Berufung:", string($vocation), "&#xA;&#xA;",
                                            "Religion:", string($religion), "&#xA;&#xA;",
                                            "Status:", string($status), "&#xA;&#xA;",
                                            "Todesursache:", string($cause_of_death))
                                            }
                              </fo:block>
        <fo:block margin-top="-1mm" margin-left="0mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_targaryen.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-40mm" margin-left="45mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_stark.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-2mm" margin-left="-5mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/hirsch.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-38mm" margin-left="45mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_martell.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-3mm" margin-left="0mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_mormont.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-38mm" margin-left="45mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_arryn.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-3mm" margin-left="0mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_graufreud.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-38mm" margin-left="45mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/löwe.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-3mm" margin-left="0mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_tully.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        <fo:block margin-top="-38mm" margin-left="48mm">
                <fo:inline>
                    <fo:external-graphic src="Bilder/haus_tyrell.png" content-width="230px" content-height="181px"></fo:external-graphic>
                </fo:inline>
        </fo:block>
        </fo:flow>
    </fo:page-sequence>
         
</fo:root> 
      
                
