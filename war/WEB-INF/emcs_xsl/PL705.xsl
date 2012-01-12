<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:include href="style.xsl" />
  <xsl:template match="//te:TraderToEMCSRequest" xmlns:te="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="//te2:TraderToEMCSRequest" xmlns:te2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ie:PL705" xmlns:ie="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:PL705:V1.00" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Prośba o wartości słowników</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Prośba o wartości słowników</xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>

            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Atrybuty
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ExternalRequest/ie:Attributes/ie:RequestingEconomicOperator" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Powód żądania</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ExternalRequest/ie:Attributes/ie:RequestReason" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Kod języka</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ExternalRequest/ie:Attributes/ie:RequestReason/@language" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Lista kodów
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:for-each select="ie:Body/ie:ExternalRequest/ie:ListOfCodes">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Żądana lista</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie:RequestedListOfCodesCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="ie2:PL705" xmlns:ie2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:PL705:V1.00" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Prośba o wartości słowników</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Prośba o wartości słowników</xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>

            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Atrybuty
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExternalRequest/ie2:Attributes/ie2:RequestingEconomicOperator" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Powód żądania</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExternalRequest/ie2:Attributes/ie2:RequestReason" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Kod języka</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExternalRequest/ie2:Attributes/ie2:RequestReason/@language" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Lista kodów
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:for-each select="ie2:Body/ie2:ExternalRequest/ie2:ListOfCodes">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Żądana lista</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:RequestedListOfCodesCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>