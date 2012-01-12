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
	<xsl:template match="ie:CD803A" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd803/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Powiadomienie o zmianie miejsca przeznaczenia wysyłany do pierwotnego odbiorcy e-AD</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Powiadomienie o zmianie miejsca przeznaczenia wysyłany do pierwotnego odbiorcy e-AD</xsl:with-param>
					</xsl:call-template>
					<fo:table xsl:use-attribute-sets="glowna-tabela">
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										1 Powiadomienie
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1a Typ powiadomienia</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:NotificationOfDivertedEaad/ie:ExciseNotification/ie:NotificationType" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1b Data i czas powiadomienia</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="stringIn" select="ie:Body/ie:NotificationOfDivertedEaad/ie:ExciseNotification/ie:NotificationDateAndTime" />
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1c Numer ARC</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:NotificationOfDivertedEaad/ie:ExciseNotification/ie:AadReferenceCode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1d Numer porządkowy</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:NotificationOfDivertedEaad/ie:ExciseNotification/ie:SequenceNumber" />
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
  <xsl:template match="ie2:IE803" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE803:V1.51" xmlns:tms="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:variable name="tekst">
          <xsl:choose>
            <xsl:when test="ie2:Body/ie2:NotificationOfDivertedEAD/ie2:ExciseNotification/ie2:NotificationType = 1">
                Powiadomienie o zmianie miejsca przeznaczenia wysyłany do pierwotnego odbiorcy e-AD
            </xsl:when>
            <xsl:otherwise>
                Powiadomienie o podziale przemieszczenia
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">
            <xsl:value-of select="$tekst" />
          </xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">
              <xsl:value-of select="$tekst" />
            </xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    1 Powiadomienie
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1b Data i czas powiadomienia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:NotificationOfDivertedEAD/ie2:ExciseNotification/ie2:NotificationDateAndTime" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1c Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:NotificationOfDivertedEAD/ie2:ExciseNotification/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1d Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:NotificationOfDivertedEAD/ie2:ExciseNotification/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:NotificationOfDivertedEAD/ie2:DownstreamArc">
                <xsl:for-each select="ie2:Body/ie2:NotificationOfDivertedEAD/ie2:DownstreamArc">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2 Podrzędne ARC
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:AdministrativeReferenceCode" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:for-each>
              </xsl:if>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>