<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:include href="style.xsl" />
  <xsl:template match="//et:EMCSToTrader" xmlns:et="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:EMCS-TRADER:REQUEST:V1.00">
    <xsl:for-each select="et:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="//et2:EMCSToTrader" xmlns:et2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:EMCS-TRADER:REQUEST:V1.00">
    <xsl:for-each select="et2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ie:PL716" xmlns:ie="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:PL716:V1.00" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Powiadomienie o kontroli</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Powiadomienie o kontroli</xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>

            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Dane kontroli
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Data i czas podjęcia decyzji o kontroli</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie:Body/ie:ControlNotificationForExciseMovement/ie:Attributes/ie:DateAndTimeOfIssuanceOfControl" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Flaga kontroli</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ControlNotificationForExciseMovement/ie:Attributes/ie:ControlFlag" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Informacje o kontroli</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ControlNotificationForExciseMovement/ie:Attributes/ie:ControlInformation" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Dokument e-AD przemieszczenia wyrobów akcyzowych
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ControlNotificationForExciseMovement/ie:ExciseMovementEad/ie:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3b Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ControlNotificationForExciseMovement/ie:ExciseMovementEad/ie:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3c Lokalny numer referencyjny</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie:Body/ie:ControlNotificationForExciseMovement/ie:ExciseMovementEad/ie:LocalReferenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="ie2:PL716" xmlns:ie2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:PL716:V1.00" xmlns:tms="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Powiadomienie o kontroli</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Powiadomienie o kontroli</xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>

            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Dane kontroli
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Data i czas podjęcia decyzji o kontroli</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:ControlNotificationForExciseMovement/ie2:Attributes/ie2:DateAndTimeOfIssuanceOfControl" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Flaga kontroli</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ControlNotificationForExciseMovement/ie2:Attributes/ie2:ControlFlag" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Informacje o kontroli</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ControlNotificationForExciseMovement/ie2:Attributes/ie2:ControlInformation" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Dokument e-AD przemieszczenia wyrobów akcyzowych
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ControlNotificationForExciseMovement/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3b Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ControlNotificationForExciseMovement/ie2:ExciseMovementEad/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3c Lokalny numer referencyjny</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ControlNotificationForExciseMovement/ie2:ExciseMovementEad/ie2:LocalReferenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>