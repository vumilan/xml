<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
            <head>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
                <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <meta http-equiv="content-language" content="en"/>
                <meta name="author" content="Milan Vu"/>
                <title>Country facts</title>
                <link rel="stylesheet" type="text/css" href="./css/index.css"/>
            </head>
            <body>
              <!-- Navbar -->
              <nav class="navbar navbar-default">
              <div class="container">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand">xHTML output of countries</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                  <ul class="nav navbar-nav navbar-right">
                    <xsl:for-each select="country_fact_document/country">
                      <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><xsl:value-of select="name"/><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="#{@id}">Images</a></li>
                          <li><a href="#{@id}_introduction">Introduction</a></li>
                          <li><a href="#{@id}_geography">Geography</a></li>
                          <li><a href="#{@id}_society">Society</a></li>
                          <li><a href="#{@id}_economy">Economy</a></li>
                        </ul>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
              </nav>
              <xsl:for-each select="country_fact_document/country">
                <!-- Name -->
                <div class="container-fluid bg-1 text-center" id="{@id}">
                  <h1 class="margin"><strong><xsl:value-of select="name"/></strong></h1>
                  <!-- Images -->
                  <div class="row">
                      <xsl:for-each select='images/image'>
                        <div class="col-sm-6">
                          <xsl:element name="img">
                            <xsl:attribute name="src">../<xsl:value-of select="."/></xsl:attribute>
                          </xsl:element>
                        </div>
                      </xsl:for-each>
                  </div>
                </div>
                <!-- Introduction -->
                <div class="container-fluid bg-5 d-inline-block" id="{@id}_introduction">
                  <h2 class="margin"><strong>Introduction</strong></h2>
                  <p><xsl:value-of select="introduction/paragraph"/></p>
                </div>
                <!-- Geography -->
                <div class="container-fluid bg-3 d-inline-block" id="{@id}_geography">
                  <h2 class="margin"><strong>Geography</strong></h2>
                  <strong>Location:</strong><p><xsl:value-of select="geography/location"/></p>
                  <strong>Coordinates:</strong><p><xsl:value-of select="geography/coordinates"/></p>
                  <strong>Map references:</strong><p><xsl:value-of select="geography/map_references"/></p>
                  <strong>Area:</strong>
                    <p><strong>Total: </strong><xsl:value-of select="geography/area/a_total"/> <xsl:value-of select="geography/area/@units"/>,
                    <strong>Land: </strong><xsl:value-of select="geography/area/land"/> <xsl:value-of select="geography/area/@units"/>,
                    <strong>Water: </strong><xsl:value-of select="geography/area/water"/> <xsl:value-of select="geography/area/@units"/></p>
                  <strong>Climate:</strong><p><xsl:value-of select="geography/climate"/></p>
                  <strong>Terrain:</strong><p><xsl:value-of select="geography/terrain"/></p>
                  <strong>Natural resources:</strong><p><xsl:value-of select="geography/natural_resources"/></p>
                </div>
                <!-- Society -->
                <div class="container-fluid bg-5 d-inline-block" id="{@id}_society">
                  <h2 class="margin"><strong>Society</strong></h2>
                  <strong>Population:</strong><p><xsl:value-of select="society/population"/> people</p>
                  <strong>Languages:</strong>
                  <p>
                    <xsl:for-each select='society/languages/language'>
                      <xsl:value-of select="."/>;
                    </xsl:for-each>
                  </p>
                  <strong>Religions:</strong><p><xsl:value-of select="society/religions"/></p>
                  <strong>Birth rate:</strong><p><xsl:value-of select="society/birth_rate"/></p>
                  <strong>Death rate:</strong><p><xsl:value-of select="society/death_rate"/></p>
                </div>
                <!-- Economy -->
                <div class="container-fluid bg-3 d-inline-block" id="{@id}_economy">
                  <h2 class="margin"><strong>Economy</strong></h2>
                  <strong>Overview:</strong>
                  <xsl:for-each select='economy/overview/paragraph'>
                    <p>
                      <xsl:value-of select="."/>;
                    </p>
                  </xsl:for-each>
                  <strong>Gdp:</strong>
                    <p>
                      <strong>Purchasing power parity:</strong><p><xsl:value-of select="economy/gdp/purchasing_power_parity"/> <xsl:value-of select="economy/gdp/purchasing_power_parity/@units"/></p>
                      <strong>Official exchange rate:</strong><p><xsl:value-of select="economy/gdp/official_exchange_rate"/> <xsl:value-of select="economy/gdp/official_exchange_rate/@units"/></p>
                      <strong>Real growth rate:</strong><p><xsl:value-of select="economy/gdp/real_growth_rate"/> <xsl:value-of select="economy/gdp/real_growth_rate/@units"/></p>
                      <strong>Per capital:</strong><p><xsl:value-of select="economy/gdp/per_capital"/> <xsl:value-of select="economy/gdp/per_capital/@units"/></p>
                      <strong>Composition:</strong>
                      <p>
                        <strong>By end use:</strong>
                        <p><strong>Household consumption: </strong><xsl:value-of select="economy/gdp/composition/by_end_use/household_consumption"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></p>
                        <p><strong>Government consumption: </strong><xsl:value-of select="economy/gdp/composition/by_end_use/government_consumption"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></p>
                        <p><strong>Investment in fixed capital: </strong><xsl:value-of select="economy/gdp/composition/by_end_use/investment_in_fixed_capital"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></p>
                        <p><strong>Investment in inventories: </strong><xsl:value-of select="economy/gdp/composition/by_end_use/investment_in_inventories"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></p>
                        <p><strong>Export of goods and services: </strong><xsl:value-of select="economy/gdp/composition/by_end_use/exports_of_goods_and_services"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></p>
                        <p><strong>Import of goods and services: </strong><xsl:value-of select="economy/gdp/composition/by_end_use/imports_of_goods_and_services"/> <xsl:value-of select="economy/gdp/composition/by_end_use/@units"/></p>
                        <strong>By sector of origin:</strong>
                        <p><strong>Agriculture: </strong><xsl:value-of select="economy/gdp/composition/by_sector_of_origin/agriculture"/> <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/@units"/></p>
                        <p><strong>Industry: </strong><xsl:value-of select="economy/gdp/composition/by_sector_of_origin/industry"/> <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/@units"/></p>
                        <p><strong>Services: </strong><xsl:value-of select="economy/gdp/composition/by_sector_of_origin/services"/> <xsl:value-of select="economy/gdp/composition/by_sector_of_origin/@units"/></p>
                      </p>
                    </p>
                    <strong>Debt:</strong><p><xsl:value-of select="economy/debt"/> <xsl:value-of select="economy/debt/@units"/></p>
                    <strong>Export:</strong>
                      <p>
                        <strong>Total: </strong><xsl:value-of select="economy/export/total"/> <xsl:value-of select="economy/export/total/@units"/><br/>
                        <strong>Partners: </strong><xsl:value-of select="economy/export/partners"/><br/>
                        <strong>Commodities: </strong><xsl:value-of select="economy/export/commodities"/>
                      </p>
                    <strong>Import:</strong>
                      <p>
                        <strong>Total: </strong><xsl:value-of select="economy/import/total"/> <xsl:value-of select="economy/import/total/@units"/><br/>
                        <strong>Partners: </strong><xsl:value-of select="economy/import/partners"/><br/>
                        <strong>Commodities: </strong><xsl:value-of select="economy/import/commodities"/>
                      </p>
                </div>

              </xsl:for-each>
              <!-- Footer -->
              <footer class="container-fluid bg-4 text-center">
                <p>XML semestral work by Milan Vu</p>
              </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
