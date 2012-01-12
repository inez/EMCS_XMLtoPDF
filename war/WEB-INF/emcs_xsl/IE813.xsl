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
	<xsl:template match="ie:CD813A" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd813/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Zmiana miejsca przeznaczenia</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Zmiana miejsca przeznaczenia</xsl:with-param>
					</xsl:call-template>
					<fo:table xsl:use-attribute-sets="glowna-tabela">
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-header>
						</fo:table-header>
						<fo:table-body>
							<xsl:if test="ie:Body/ie:ChangeOfDestination/ie:Attributes/ie:DateAndTimeOfValidationOfChangeOfDestination">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">1a Data i czas zatwierdzenia zmiany miejsca przeznaczenia</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="formatDate">
												<xsl:with-param name="stringIn" select="ie:Body/ie:ChangeOfDestination/ie:Attributes/ie:DateAndTimeOfValidationOfChangeOfDestination"/>
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										2 Uzupełnienie dokumentu e-AD
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2b Numer ARC</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:UpdateEaad/ie:AadReferenceCode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2a Numer porządkowy</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:UpdateEaad/ie:SequenceNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2c Czas przewozu</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:UpdateEaad/ie:JourneyTime" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2d Zmieniona organizacja przewozu</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:UpdateEaad/ie:ChangedTransportArrangement" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2e Numer faktury</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:UpdateEaad/ie:InvoiceNumber" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2f Data faktury</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:UpdateEaad/ie:InvoiceDate" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2g Kod rodzaju transportu</xsl:with-param>
										</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:UpdateEaad/ie:TransportModeCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										3 Zmienione miejsce przeznaczenia
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">3a Kod rodzaju miejsca przeznaczenia</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DestinationTypeCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											4 PODMIOT Nowy Odbiorca
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4c Ulica</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4d Numer domu</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4f Miejscowość</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4g Kod języka</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:NewConsigneeTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											5 PODMIOT Miejsce dostawy
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5c Ulica</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5d Numer domu</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5f Miejscowość</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5g Kod języka</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceCustomsOffice">
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
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:ChangedDestination/ie:DeliveryPlaceCustomsOffice/ie:ReferenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											7 PODMIOT Nowy organizator transportu
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7a Numer VAT</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader/ie:VatNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7b Nazwa podmiotu gospodarczego</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7c Ulica</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7d Numer domu</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7f Miejscowość</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7g Kod języka</xsl:with-param>
											</xsl:call-template>
												<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransportArrangerTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											8 PODMIOT Nowy przewoźnik
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8a Numer VAT</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader/ie:VatNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8b Nazwa podmiotu gospodarczego</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8g Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:ChangeOfDestination/ie:NewTransporterTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
								<xsl:for-each select="ie:Body/ie:ChangeOfDestination/ie:TransportDetails">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
											<fo:block>
												9 Szczegóły dotyczące transportu
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">9a Kod jednostki transportowej</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:TransportUnitCode" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">9b Oznaczenie jednostek transportowych</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:IdentityOfTransportUnits" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">9c Oznaczenie pieczęci handlowej (zabezpieczenia urzędowego)</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:CommercialSealIdentification" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">9d Informacje o pieczęci handlowej (zabezpieczeniu urzędowym)</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:SealInformation" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">9e Kod języka</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:SealInformation/@language" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">9f Dodatkowe informacje</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:ComplementaryInformation" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">9g Kod języka</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:ComplementaryInformation/@language" />
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
  <xsl:template match="ie2:IE813" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE813:V1.51" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Zmiana miejsca przeznaczenia</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Zmiana miejsca przeznaczenia</xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-header>
            </fo:table-header>
            <fo:table-body>
              <xsl:if test="ie2:Body/ie2:ChangeOfDestination/ie2:Attributes/ie2:DateAndTimeOfValidationOfChangeOfDestination">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">1a Data i czas zatwierdzenia zmiany miejsca przeznaczenia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:call-template name="formatDate">
                        <xsl:with-param name="stringIn" select="ie2:Body/ie2:ChangeOfDestination/ie2:Attributes/ie2:DateAndTimeOfValidationOfChangeOfDestination"/>
                      </xsl:call-template>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Uzupełnienie dokumentu e-AD
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:UpdateEad/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:UpdateEad/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Czas przewozu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:UpdateEad/ie2:JourneyTime" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2d Zmieniona organizacja przewozu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:UpdateEad/ie2:ChangedTransportArrangement" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2e Numer faktury</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:UpdateEad/ie2:InvoiceNumber" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2f Data faktury</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:UpdateEad/ie2:InvoiceDate" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2g Kod rodzaju transportu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:UpdateEad/ie2:TransportModeCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Zmienione miejsce przeznaczenia
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3a Kod rodzaju miejsca przeznaczenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DestinationTypeCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4 PODMIOT Nowy Odbiorca
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4a Identyfikacja podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader/ie2:Traderid" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:NewConsigneeTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      5 PODMIOT Miejsce dostawy
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5a Identyfikacja podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader/ie2:Traderid" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceCustomsOffice">
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
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:DestinationChanged/ie2:DeliveryPlaceCustomsOffice/ie2:ReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      7 PODMIOT Nowy organizator transportu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7a Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader/ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7b Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransportArrangerTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      8 PODMIOT Nowy przewoźnik
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8a Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader/ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8b Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:ChangeOfDestination/ie2:NewTransporterTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:for-each select="ie2:Body/ie2:ChangeOfDestination/ie2:TransportDetails">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      9 Szczegóły dotyczące transportu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">9a Kod jednostki transportowej</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:TransportUnitCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">9b Oznaczenie jednostek transportowych</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:IdentityOfTransportUnits" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">9c Oznaczenie pieczęci handlowej (zabezpieczenia urzędowego)</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:CommercialSealIdentification" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">9d Informacje o pieczęci handlowej (zabezpieczeniu urzędowym)</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:SealInformation" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">9e Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:SealInformation/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">9f Dodatkowe informacje</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ComplementaryInformation" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">9g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ComplementaryInformation/@language" />
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