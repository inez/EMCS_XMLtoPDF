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
	<xsl:template match="ie:PL817" xmlns:ie="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:PL817:V1.00" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Powiadomienie o przybyciu wyrobów</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Powiadomienie o przybyciu wyrobów</xsl:with-param>
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
										<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ExciseMovementEad/ie:AdministrativeReferenceCode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ExciseMovementEad/ie:SequenceNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										3 Przybycie wyrobów
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">3a Data i czas przybycia</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="stringIn" select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryNotification/ie:DateAndTimeOfDelivery" />
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">3b Znacznik naruszonych zabezpieczeń</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryNotification/ie:SealCompromised" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">3c Informacje dodatkowe</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryNotification/ie:DeliveryInformation" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											4 PODMIOT Odbierający
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ConsigneeTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ConsigneeTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ConsigneeTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ConsigneeTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ConsigneeTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:ConsigneeTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							<xsl:if test="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryPlaceTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											5 PODMIOT – Miejsce dostawy
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryPlaceTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryPlaceTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryPlaceTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryPlaceTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryPlaceTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DeliveryPlaceTrader/ie:City" />
										</fo:block>
									</fo:table-cell>									
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DestinationOffice">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											6 URZĄD Miejsce dostawy – Urząd celny
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6a Numer referencyjny urzędu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:DeliveryNotificationForExciseMovement/ie:DestinationOffice/ie:ReferenceNumber" />
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
  <xsl:template match="ie2:PL817" xmlns:ie2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:PL817:V1.00" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Powiadomienie o przybyciu wyrobów</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Powiadomienie o przybyciu wyrobów</xsl:with-param>
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
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ExciseMovementEad/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Przybycie wyrobów
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3a Data i czas przybycia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryNotification/ie2:DateAndTimeOfDelivery" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3b Znacznik naruszonych zabezpieczeń</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryNotification/ie2:SealCompromised" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3c Informacje dodatkowe</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryNotification/ie2:DeliveryInformation" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    4 PODMIOT Odbierający
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">4a Identyfikacja podmiotu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ConsigneeTrader/ie2:Traderid" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">4b Nazwa podmiotu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ConsigneeTrader/ie2:TraderName" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">4c Ulica</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ConsigneeTrader/ie2:StreetName" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">4d Numer domu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ConsigneeTrader/ie2:StreetNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">4e Kod pocztowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ConsigneeTrader/ie2:Postcode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">4f Miejscowość</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:ConsigneeTrader/ie2:City" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryPlaceTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      5 PODMIOT – Miejsce dostawy
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5a Identyfikacja podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryPlaceTrader/ie2:Traderid" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryPlaceTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryPlaceTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryPlaceTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryPlaceTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DeliveryPlaceTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DestinationOffice">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      6 URZĄD Miejsce dostawy – Urząd celny
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6a Numer referencyjny urzędu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:DeliveryNotificationForExciseMovement/ie2:DestinationOffice/ie2:ReferenceNumber" />
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