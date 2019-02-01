<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">

    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
         <fo:simple-page-master master-name="maintmpl" page-height="29.7cm" page-width="21.0cm"
                                margin-top="1.5cm" margin-bottom="1.5cm" margin-left="1.5cm" margin-right="1.5cm">

            <fo:region-body margin-top="1cm" margin-bottom="0.2cm" />
            <fo:region-before extent="1cm"/>
            <fo:region-after extent="1.5cm"/>

         </fo:simple-page-master>
     </fo:layout-master-set>

     <fo:page-sequence master-reference="maintmpl">

        <fo:static-content flow-name="xsl-region-before">
            <fo:block line-height="13pt" font-size="13pt" border-after-width="thin" border-after-style="solid" padding-bottom="2px"
                      text-align-last="justify">
                PDF output of countries
                  <fo:leader leader-pattern="space" />
                vumilan [BI-XML]
            </fo:block>
        </fo:static-content>

        <fo:static-content flow-name="xsl-region-after">
           <fo:block font-size="11pt" text-align="center" border-before-width="thin" border-before-style="solid" padding-top="10px" margin-top="5px">
            Page <fo:inline font-weight="bold"><fo:page-number/></fo:inline> of <fo:page-number-citation ref-id="last-page"/>
           </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body">
            <fo:block break-before="page">

               <fo:block font-size="25pt" text-align="center" font-weight="bold" margin-bottom="20mm">
                  Navigation
               </fo:block>

               <xsl:for-each select="country_fact_document/country">
                 <fo:block text-align="left" font-weight="bold" font-size="25pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}">
                     <xsl:value-of select="name" />
                   </fo:basic-link>
                 </fo:block>
                 <fo:block text-align="left" font-size="14pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}_introduction">
                     Introduction
                   </fo:basic-link>
                 </fo:block>
                 <fo:block text-align="left" font-size="14pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}_society">
                     Society
                   </fo:basic-link>
                 </fo:block>
                 <fo:block text-align="left" font-size="14pt" margin-bottom="2mm">
                   <fo:basic-link internal-destination="{@id}_geography">
                     Geography
                   </fo:basic-link>
                 </fo:block>
                 <fo:block text-align="left" font-size="14pt" margin-bottom="10mm">
                   <fo:basic-link internal-destination="{@id}_economy">
                     Economy
                   </fo:basic-link>
                 </fo:block>
               </xsl:for-each>

            </fo:block>
            <xsl:for-each select="country_fact_document/country">
              <fo:block break-before="page">

                 <fo:block text-align="center" font-weight="bold" font-size="25pt" id="{@id}">
                    <xsl:value-of select="name" />
                 </fo:block>
                 <fo:table table-layout="auto">
                   <fo:table-column column-width="50%"/>
                   <fo:table-column column-width="50%"/>
                   <fo:table-body>
                     <fo:table-row>
                        <xsl:for-each select="images/image">
                          <fo:table-cell>
                            <fo:block text-align="center">
                              <xsl:element name="fo:external-graphic">
                                 <xsl:attribute name="src">
                                       ./<xsl:value-of select="." />
                                 </xsl:attribute>
                                 <xsl:attribute name="content-width">200px</xsl:attribute>
                                 <xsl:attribute name="width">200px</xsl:attribute>
                              </xsl:element>
                            </fo:block>
                          </fo:table-cell>
                        </xsl:for-each>
                      </fo:table-row>
                    </fo:table-body>
                 </fo:table>
                 <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_introduction" margin-bottom="4mm">
                    Introduction:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="10mm">
                    <xsl:value-of select="introduction/paragraph" />
                 </fo:block>
                 <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_geography" margin-bottom="4mm">
                    Geography:
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Location:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="geography/location" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Coordinates:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="geography/coordinates" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Map reference:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="geography/map_references" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Area:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    Total: <xsl:value-of select="geography/area/a_total" /> sq km,
                    Land: <xsl:value-of select="geography/area/land" /> sq km,
                    Water: <xsl:value-of select="geography/area/water" /> sq km
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Climate:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="geography/climate" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Terrain:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="geography/terrain" />
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Natural resources:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="10mm">
                    <xsl:value-of select="geography/natural_resources" />
                 </fo:block>
                 <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_society" margin-bottom="4mm">
                    Society:
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Population:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="society/population" /> people
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Population:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="society/population" /> people
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Languages:
                 </fo:block>
                 <fo:block font-size="12pt">
                   <xsl:for-each select='society/languages/language'>
                     <xsl:value-of select="." />;
                   </xsl:for-each>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Religions:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="society/religion" /> people
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Birth rate:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="society/birth_rate" /> people
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Death rate:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="society/death_rate" /> people
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Population distribution:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="10mm">
                    <xsl:value-of select="society/population_distribution" /> people
                 </fo:block>
                 <fo:block text-align="left" font-weight="bold" font-size="18pt" id="{@id}_economy" margin-bottom="4mm">
                    Economy:
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Overview:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="society/population_distribution" /> people
                 </fo:block>
                 <xsl:for-each select='economy/overview/paragraph'>
                   <fo:block font-size="12pt" margin-bottom="2mm">
                      <xsl:value-of select="."/>
                   </fo:block>
                 </xsl:for-each>
                 <fo:block font-size="12pt" font-weight="bold">
                    Gdp:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <fo:list-block provisional-distance-between-starts="10px" start-indent="10px" font-size="12pt">
                        <fo:list-item>
                          <fo:list-item-label end-indent="label-end()">
                            <fo:block>-</fo:block>
                          </fo:list-item-label>
                          <fo:list-item-body start-indent="body-start()">
                            <fo:block>Purchasing power parity: <xsl:value-of select="economy/gdp/purchasing_power_parity" /> <xsl:value-of select="economy/gdp/purchasing_power_parity/@units"/></fo:block>
                          </fo:list-item-body>
                        </fo:list-item>
                        <fo:list-item>
                          <fo:list-item-label end-indent="label-end()">
                            <fo:block>-</fo:block>
                          </fo:list-item-label>
                          <fo:list-item-body start-indent="body-start()">
                            <fo:block>Official exchange rate: <xsl:value-of select="economy/gdp/official_exchange_rate" /> <xsl:value-of select="economy/gdp/official_exchange_rate/@units"/></fo:block>
                          </fo:list-item-body>
                        </fo:list-item>
                        <fo:list-item>
                          <fo:list-item-label end-indent="label-end()">
                            <fo:block>-</fo:block>
                          </fo:list-item-label>
                          <fo:list-item-body start-indent="body-start()">
                            <fo:block>Real growth rate: <xsl:value-of select="economy/gdp/real_growth_rate" /> <xsl:value-of select="economy/gdp/real_growth_rate/@units"/></fo:block>
                          </fo:list-item-body>
                        </fo:list-item>
                        <fo:list-item>
                          <fo:list-item-label end-indent="label-end()">
                            <fo:block>-</fo:block>
                          </fo:list-item-label>
                          <fo:list-item-body start-indent="body-start()">
                            <fo:block>Per capital: <xsl:value-of select="economy/gdp/per_capital" /> <xsl:value-of select="economy/gdp/per_capital/@units"/></fo:block>
                          </fo:list-item-body>
                        </fo:list-item>
                        <fo:list-item>
                          <fo:list-item-label end-indent="label-end()">
                            <fo:block>-</fo:block>
                          </fo:list-item-label>
                          <fo:list-item-body start-indent="body-start()">
                            <fo:block>Composition:</fo:block>
                            <fo:block>By end use:</fo:block>
                            <fo:block> - Household consumption: <xsl:value-of select="economy/gdp/composition/by_end_use/household_consumption"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></fo:block>
                            <fo:block> - Government consumption: <xsl:value-of select="economy/gdp/composition/by_end_use/government_consumption"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></fo:block>
                            <fo:block> - Investment in fixed capital: <xsl:value-of select="economy/gdp/composition/by_end_use/investment_in_fixed_capital"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></fo:block>
                            <fo:block> - Investment in inventories: <xsl:value-of select="economy/gdp/composition/by_end_use/investment_in_inventories"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></fo:block>
                            <fo:block> - Export of goods and services: <xsl:value-of select="economy/gdp/composition/by_end_use/exports_of_goods_and_services"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></fo:block>
                            <fo:block> - Import of goods and services: <xsl:value-of select="economy/gdp/composition/by_end_use/imports_of_goods_and_services"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></fo:block>
                            <fo:block>By sector of origin:</fo:block>
                            <fo:block> - Agriculture: <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/agriculture"/> <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/@units"/></fo:block>
                            <fo:block> - Industry: <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/industry"/> <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/@units"/></fo:block>
                            <fo:block> - Services: <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/services"/> <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/@units"/></fo:block>
                          </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Debt:
                 </fo:block>
                 <fo:block font-size="12pt" margin-bottom="2mm">
                    <xsl:value-of select="economy/debt"/> <xsl:value-of select="economy/debt/@units"/>
                 </fo:block>
                 <fo:block font-size="12pt" font-weight="bold">
                    Export:
                 </fo:block>
                 <fo:list-block provisional-distance-between-starts="10px"
                 start-indent="10px" font-size="12pt" margin-bottom="2mm">

                     <fo:list-item>
                       <fo:list-item-label end-indent="label-end()">
                         <fo:block>-</fo:block>
                       </fo:list-item-label>
                       <fo:list-item-body start-indent="body-start()">
                         <fo:block>Total: <xsl:value-of select="economy/export/total"/> <xsl:value-of select="economy/export/total/@units"/></fo:block>
                       </fo:list-item-body>
                     </fo:list-item>

                     <fo:list-item>
                       <fo:list-item-label end-indent="label-end()">
                         <fo:block>-</fo:block>
                       </fo:list-item-label>
                       <fo:list-item-body start-indent="body-start()">
                         <fo:block>Partners: <xsl:value-of select="economy/export/partners"/></fo:block>
                       </fo:list-item-body>
                     </fo:list-item>

                     <fo:list-item>
                       <fo:list-item-label end-indent="label-end()">
                         <fo:block>-</fo:block>
                       </fo:list-item-label>
                       <fo:list-item-body start-indent="body-start()">
                         <fo:block>Commodities: <xsl:value-of select="economy/export/commodities"/></fo:block>
                       </fo:list-item-body>
                     </fo:list-item>

                  </fo:list-block>

                  <fo:block font-size="12pt" font-weight="bold">
                     Import:
                  </fo:block>
                  <fo:list-block provisional-distance-between-starts="10px"
                  start-indent="10px" font-size="12pt" margin-bottom="2mm">

                      <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                          <fo:block>-</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                          <fo:block>Total: <xsl:value-of select="economy/import/total"/> <xsl:value-of select="economy/export/total/@units"/></fo:block>
                        </fo:list-item-body>
                      </fo:list-item>

                      <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                          <fo:block>-</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                          <fo:block>Partners: <xsl:value-of select="economy/import/partners"/></fo:block>
                        </fo:list-item-body>
                      </fo:list-item>

                      <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                          <fo:block>-</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="body-start()">
                          <fo:block>Commodities: <xsl:value-of select="economy/import/commodities"/></fo:block>
                        </fo:list-item-body>
                      </fo:list-item>

                   </fo:list-block>
              </fo:block>
            </xsl:for-each>
            <fo:block id="last-page"/>
        </fo:flow>

     </fo:page-sequence>

    </fo:root>

  </xsl:template>
</xsl:stylesheet>
