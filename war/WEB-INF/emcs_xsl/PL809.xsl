<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:include href="style.xsl" />
  <xsl:include href="enums.xsl" />
  <xsl:template match="//te2:TraderToEMCSRequest" xmlns:te2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="//et2:EMCSToTrader" xmlns:et2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:EMCS-TRADER:REQUEST:V1.00">
    <xsl:for-each select="et2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ie2:PL809" xmlns:ie2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:PL809:V1.00" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">
            Anulowanie powiadomienia o wysyłce wyrobów
          </xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">
              Anulowanie powiadomienia o wysyłce wyrobów
            </xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)" />
            <fo:table-column column-width="proportional-column-width(1)" />
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    1 POWIADOMIENIE O WYSYŁCE WYROBÓW AKCYZOWYCH
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">
                        1a Lokalny numer referencyjny
                      </xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of
                      select="ie2:Body/ie2:CancellationOfDraftOfDelivery/ie2:DraftOfDelivery/ie2:LocalReferenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 ANULOWANIE
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">
                        2a Przyczyna anulowania
                      </xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of
                      select="ie2:Body/ie2:CancellationOfDraftOfDelivery/ie2:Cancellation/ie2:CancellationReasonCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">
                        2b Dodatkowe informacje
                      </xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of
                      select="ie2:Body/ie2:CancellationOfDraftOfDelivery/ie2:Cancellation/ie2:ComplementaryInformation" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 CECHA
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">
                        3a Data i czas zatwierdzenia anulowania
                      </xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of
                      select="ie2:Body/ie2:CancellationOfDraftOfDelivery/ie2:Attributes/ie2:DateAndTimeOfValidationOfCancellation" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}" />
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>