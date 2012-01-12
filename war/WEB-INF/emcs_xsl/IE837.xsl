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
	<xsl:template match="ie:CD837A" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd837/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Wyjaśnienie opóźnienia przesłania raportu odbioru</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Wyjaśnienie opóźnienia przesłania raportu odbioru</xsl:with-param>
					</xsl:call-template>
					<fo:table xsl:use-attribute-sets="glowna-tabela">
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-header>
						</fo:table-header>
						<fo:table-body>
							<xsl:if test="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:DateAndTimeOfValidationOfExplanationOnDelay">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">1a Data i czas zatwierdzenia wyjaśnienia</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="formatDate">
												<xsl:with-param name="stringIn" select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:DateAndTimeOfValidationOfExplanationOnDelay"/>
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										2 Dokument e-AD przemieszczenia wyrobów akcyzowych
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:ExciseMovementEaad/ie:AadReferenceCode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:ExciseMovementEaad/ie:SequenceNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										3 Opóźnienie przesłania raportu odbioru
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">3a Typ podmiotu składającego</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:SubmitterType" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">3b Identyfikacja podmiotu składającego</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:SubmitterIdentification" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">3c Kod przyczyny opóźnienia</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:ExplanationCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:ComplementaryInformation">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3d Dodatkowe informacje</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:ComplementaryInformation" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3e Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ExplanationOnDelayForDelivery/ie:Attributes/ie:ComplementaryInformation/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
						</fo:table-body>
					</fo:table>
					<fo:block id="last-page_{position()}"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
  <xsl:template match="ie2:IE837" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE837:V1.51" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:variable name="CzyDotRaportuOdbioru">
            <xsl:choose>
                <xsl:when test="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:MessageRole = 1">1</xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="tekst">
          <xsl:choose>
            <xsl:when test="$CzyDotRaportuOdbioru = 1">
                Wyjaśnienie zwłoki w wysyłce raportu odbioru
            </xsl:when>
            <xsl:otherwise>
                Wyjaśnienie zwłoki w podaniu danych Odbiorcy
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
            <fo:table-header>
            </fo:table-header>
            <fo:table-body>
              <xsl:if test="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:DateAndTimeOfValidationOfExplanationOnDelay">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      1 CECHA
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">1a Data i czas zatwierdzenia wyjaśnienia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:call-template name="formatDate">
                        <xsl:with-param name="stringIn" select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:DateAndTimeOfValidationOfExplanationOnDelay"/>
                      </xsl:call-template>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Dokument e-AD przemieszczenia wyrobów akcyzowych
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:ExciseMovementEad/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Wyjaśnienie opóźnienia
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3a Typ podmiotu składającego</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:SubmitterType" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3b Identyfikacja podmiotu składającego</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:SubmitterIdentification" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3c Kod przyczyny opóźnienia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:ExplanationCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:ComplementaryInformation">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3d Dodatkowe informacje</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:ComplementaryInformation" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3e Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ExplanationOnDelayForDelivery/ie2:Attributes/ie2:ComplementaryInformation/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>