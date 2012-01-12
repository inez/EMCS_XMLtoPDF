<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="style.xsl" />
	<xsl:include href="enums.xsl" />
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
  <xsl:template match="ie:CD802A" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd802/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:variable name="tekst">
					<xsl:choose>
						<xsl:when test="ie:Body/ie:ReminderMessageForExciseMovement/ie:Attributes/ie:ReminderMessageType = 1">
							Komunikat przypomnienia o upływie terminu na zmianę miejsca przeznaczenia
						</xsl:when>
						<xsl:otherwise>
                            Komunikat przypomnienia o upływie terminu przesłania raportu odbioru
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
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										1 Dane przypomnienia 
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1a Data i czas przypomnienia</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="stringIn" select="ie:Body/ie:ReminderMessageForExciseMovement/ie:Attributes/ie:DateAndTimeOfIssuanceOfReminder" />
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1b Informacja o przypomnieniu</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ReminderMessageForExciseMovement/ie:Attributes/ie:ReminderInformation" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1c Kod języka</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ReminderMessageForExciseMovement/ie:Attributes/ie:ReminderInformation/@language" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1d Limit daty i czasu</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="stringIn" select="ie:Body/ie:ReminderMessageForExciseMovement/ie:Attributes/ie:LimitDateAndTime" />
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
		                                        </fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1e Typ wiadomości przypomnienia</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="ReminderMessageType">
											<xsl:with-param name="stringIn" select="ie:Body/ie:ReminderMessageForExciseMovement/ie:Attributes/ie:ReminderMessageType" />
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										2 Dokument e-AD przemieszczenia wyrobów akcyzowych
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ReminderMessageForExciseMovement/ie:ExciseMovementEaad/ie:AadReferenceCode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ReminderMessageForExciseMovement/ie:ExciseMovementEaad/ie:SequenceNumber" />
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
  <xsl:template match="ie2:IE802" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE802:V1.51" xmlns:tms="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:variable name="tekst">
          <xsl:choose>
            <xsl:when test="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:Attributes/ie2:ReminderMessageType = 1">
                Komunikat przypomnienia o upływie terminu na zmianę miejsca przeznaczenia
            </xsl:when>
            <xsl:when test="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:Attributes/ie2:ReminderMessageType = 2">
                Komunikat przypomnienia o upływie terminu na przesłanie raportu odbioru
            </xsl:when>
            <xsl:otherwise>
                Komunikat przypomnienia o upływie terminu na podanie danych Odbiorcy
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
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    1 Dane przypomnienia
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1a Data i czas przypomnienia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:Attributes/ie2:DateAndTimeOfIssuanceOfReminder" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1b Informacja o przypomnieniu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:Attributes/ie2:ReminderInformation" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1c Kod języka</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:Attributes/ie2:ReminderInformation/@language" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1d Limit daty i czasu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:Attributes/ie2:LimitDateAndTime" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1e Typ wiadomości przypomnienia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="ReminderMessageType">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:Attributes/ie2:ReminderMessageType" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Dokument e-AD przemieszczenia wyrobów akcyzowych
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ReminderMessageForExciseMovement/ie2:ExciseMovementEad/ie2:SequenceNumber" />
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