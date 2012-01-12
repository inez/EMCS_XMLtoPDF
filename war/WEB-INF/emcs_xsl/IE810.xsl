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
  <xsl:template match="ie:CD810A" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd810/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Anulowanie e-AD</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Anulowanie e-AD</xsl:with-param>
					</xsl:call-template>
					<fo:table xsl:use-attribute-sets="glowna-tabela">
						<fo:table-column />
						<fo:table-header>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>1 Dokument e-AD Przemieszczenia wyrobów akcyzowych</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1a Numer ARC</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ConfirmationOfCancellationOfEaad/ie:ExciseMovementEaad/ie:AadReferenceCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										2 Anulowanie
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2a Kod przyczyny anulowania</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ConfirmationOfCancellationOfEaad/ie:Cancellation/ie:CancellationReasonCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="ie:Body/ie:ConfirmationOfCancellationOfEaad/ie:Attributes/ie:DateAndTimeOfValidationOfCancellation">
								<fo:table-row>
									<fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3a Data i czas zatwierdzenia anulowania</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="formatDate">
												<xsl:with-param name="stringIn" select="ie:Body/ie:ConfirmationOfCancellationOfEaad/ie:Attributes/ie:DateAndTimeOfValidationOfCancellation"/>
											</xsl:call-template>
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
  <xsl:template match="ie2:IE810" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE810:V1.51" xmlns:tms="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Anulowanie e-AD</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Anulowanie e-AD</xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-header>
            </fo:table-header>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>1 Dokument e-AD Przemieszczenia wyrobów akcyzowych</fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:CancellationOfEAD/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Anulowanie
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Kod przyczyny anulowania</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:CancellationOfEAD/ie2:Cancellation/ie2:CancellationReasonCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Dodatkowe informacje</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:CancellationOfEAD/ie2:Cancellation/ie2:ComplementaryInformation" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Kod języka</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:CancellationOfEAD/ie2:Cancellation/ie2:ComplementaryInformation/@language" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:CancellationOfEAD/ie2:Attributes/ie2:DateAndTimeOfValidationOfCancellation">
                <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Data i czas zatwierdzenia anulowania</xsl:with-param>
                      </xsl:call-template>
                      <xsl:call-template name="formatDate">
                        <xsl:with-param name="stringIn" select="ie2:Body/ie2:CancellationOfEAD/ie2:Attributes/ie2:DateAndTimeOfValidationOfCancellation"/>
                      </xsl:call-template>
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