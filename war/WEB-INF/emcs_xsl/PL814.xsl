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
	<xsl:template match="ie:PL814" xmlns:ie="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:PL814:V1.00" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Powiadomienie o wysyłce wyrobów</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Powiadomienie o wysyłce wyrobów</xsl:with-param>
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
										1 Nagłówek dokumentu e-AD
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1a Kod rodzaju miejsca przeznaczenia</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:HeaderEad/ie:DestinationTypeCode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1b Czas przewozu</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:HeaderEad/ie:JourneyTime" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1c Organizacja przewozu</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:HeaderEad/ie:TransportArrangement" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1j Kod przemieszczenia</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:Attributes/ie:MovementCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										2 PODMIOT Wysyłający
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2a Numer akcyzowy podmiotu</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsignorTrader/ie:TraderExciseNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2b Nazwa podmiotu</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsignorTrader/ie:TraderName" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2c Ulica</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsignorTrader/ie:StreetName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2d Numer domu</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsignorTrader/ie:StreetNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2e Kod pocztowy</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsignorTrader/ie:Postcode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2f Miejscowość</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsignorTrader/ie:City" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2g Kod języka</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsignorTrader/@language" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											3 PODMIOT – Miejsce wysyłki
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3a Numer składu podatkowego</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader/ie:ReferenceOfTaxWarehouse" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3g Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:PlaceOfDispatchTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery/ie:DispatchImportOffice">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											4 URZĄD wysyłki – Przywóz
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4a Numer referencyjny urzędu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DispatchImportOffice/ie:ReferenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											5 PODMIOT Odbierający
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5g Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ConsigneeTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery/ie:ComplementConsigneeTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											6 UZUPEŁNIENIE – PODMIOT Odbierający
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6a Kod państwa członkowskiego podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ComplementConsigneeTrader/ie:MemberStateCode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6b Numer seryjny świadectwa zwolnienia</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:ComplementConsigneeTrader/ie:SerialNumberOfCertificateOfExemption" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											7 PODMIOT – Miejsce dostawy
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">7g Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceCustomsOffice">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											8 URZĄD Miejsce dostawy – Urząd celny
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">8a Numer referencyjny urzędu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:DeliveryPlaceCustomsOffice/ie:ReferenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										9 Dokument e-AD
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">9a Lokalny numer referencyjny</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:EadDraft/ie:LocalReferenceNumber" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">9b Numer faktury</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:EadDraft/ie:InvoiceNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">9c Data faktury</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:EadDraft/ie:InvoiceDate" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">9d Kod rodzaju miejsca pochodzenia rozpoczęcia przemieszczenia</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:EadDraft/ie:OriginTypeCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">9e Data wysyłki</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:EadDraft/ie:DateOfDispatch" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">9f Czas wysyłki</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:EadDraft/ie:TimeOfDispatch" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery//ie:CompetentAuthorityDispatchOffice">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											10 URZĄD – Właściwy urząd w miejscu wysyłki
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">10a Numer referencyjny urzędu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:CompetentAuthorityDispatchOffice/ie:ReferenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										11 Gwarancja dotycząca przemieszczenia
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">11a Kod rodzaju gwaranta</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery//ie:MovementGuarantee/ie:GuarantorTypeCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ie:Body/ie:SubmittedDraftOfDelivery/ie:MovementGuarantee/ie:GuarantorTrader">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
											<fo:block>
												12 PODMIOT Gwarant
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12a Numer akcyzowy podmiotu</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:TraderExciseNumber" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12b Numer VAT</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:VatNumber" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12c Nazwa podmiotu gospodarczego</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:TraderName" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12d Ulica</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:StreetName" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12e Numer domu</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:StreetNumber" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12f Kod pocztowy</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:Postcode" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12g Miejscowość</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:City" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">12h Kod języka</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="@language" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										13 Transport
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">13a Kod rodzaju transportu</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportMode/ie:TransportModeCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="ie:Body/ie:SubmittedDraftOfDelivery//ie:TransportArrangerTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											14 PODMIOT Organizator transportu
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">14a Numer VAT</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportArrangerTrader/ie:VatNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">14b Nazwa podmiotu gospodarczego</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportArrangerTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">14c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportArrangerTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">14d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportArrangerTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">14e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportArrangerTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">14f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportArrangerTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">14g Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportArrangerTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										15 PODMIOT Pierwszy przewoźnik
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">15a Numer VAT</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:FirstTransporterTrader/ie:VatNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">15b Nazwa podmiotu gospodarczego</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:FirstTransporterTrader/ie:TraderName" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">15c Ulica</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:FirstTransporterTrader/ie:StreetName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">15d Numer domu</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:FirstTransporterTrader/ie:StreetNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">15e Kod pocztowy</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:FirstTransporterTrader/ie:Postcode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">15f Miejscowość</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:FirstTransporterTrader/ie:City" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">15g Kod języka</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:SubmittedDraftOfDelivery/ie:FirstTransporterTrader/@language" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ie:Body/ie:SubmittedDraftOfDelivery/ie:TransportDetails">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											16 Szczegóły dotyczące transportu
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">16a Kod jednostki transportowej</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:TransportUnitCode" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							<xsl:for-each select="ie:Body/ie:SubmittedDraftOfDelivery/ie:BodyEad">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											17 e-AD Wyroby
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17a Numer identyfikacyjny pozycji towarowej</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:BodyRecordUniqueReference" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17b Kod wyrobu akcyzowego</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:ExciseProductCode" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17c Kod CN</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:CnCode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17d Ilość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Quantity" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17e Masa brutto</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:GrossWeight" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17f Masa netto</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:NetWeight" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17g Zawartość alkoholu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:AlcoholicStrength" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17h Stopień Plato</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:DegreePlato" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17i Znaki akcyzy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:FiscalMark" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17j Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:FiscalMark/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17k Znak akcyzy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:FiscalMarkUsedFlag" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17l Miejsce pochodzenia</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:DesignationOfOrigin" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17m Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:DesignationOfOrigin/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17n Wielkość producenta</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:SizeOfProducer" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17o Gęstość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Density" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17p Opis handlowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:CommercialDescription" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17q Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:CommercialDescription/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17r Marka wyrobów</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:BrandNameOfProducts" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">17s Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:BrandNameOfProducts/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">17t Ilość biokomponentów (w litrach)</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:BiofuelContent" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">17u Oleje opałowe niepodlegające barwieniu i oznaczeniu</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:NotColouredAndMarkedFuelOils" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">17v Ilość wyrobu w dodatkowej jednostce miary</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:AdditionalQuantity" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">17w Maksymalna cena detaliczna za 20 szt. lub 1 kg</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:MaxRetailPrice" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">17x Rodzaj paliwa</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:FuelType" />
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
  <xsl:template match="ie2:PL814" xmlns:ie2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:PL814:V1.00" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Powiadomienie o wysyłce wyrobów</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Powiadomienie o wysyłce wyrobów</xsl:with-param>
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
                    1 Nagłówek dokumentu e-AD
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1a Kod rodzaju miejsca przeznaczenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:HeaderEad/ie2:DestinationTypeCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1b Czas przewozu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:HeaderEad/ie2:JourneyTime" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1c Organizacja przewozu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:HeaderEad/ie2:TransportArrangement" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1j Kod przemieszczenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:Attributes/ie2:MovementCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 PODMIOT Wysyłający
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer akcyzowy podmiotu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsignorTrader/ie2:TraderExciseNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Nazwa podmiotu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsignorTrader/ie2:TraderName" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Ulica</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsignorTrader/ie2:StreetName" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2d Numer domu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsignorTrader/ie2:StreetNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2e Kod pocztowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsignorTrader/ie2:Postcode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2f Miejscowość</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsignorTrader/ie2:City" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2g Kod języka</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsignorTrader/@language" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      3 PODMIOT – Miejsce wysyłki
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Numer składu podatkowego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader/ie2:ReferenceOfTaxWarehouse" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:PlaceOfDispatchTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DispatchImportOffice">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4 URZĄD wysyłki – Przywóz
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4a Numer referencyjny urzędu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DispatchImportOffice/ie2:ReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      5 PODMIOT Odbierający
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5a Identyfikacja podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader/ie2:Traderid" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ConsigneeTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ComplementConsigneeTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      6 UZUPEŁNIENIE – PODMIOT Odbierający
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6a Kod państwa członkowskiego podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ComplementConsigneeTrader/ie2:MemberStateCode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6b Numer seryjny świadectwa zwolnienia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:ComplementConsigneeTrader/ie2:SerialNumberOfCertificateOfExemption" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      7 PODMIOT – Miejsce dostawy
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7a Identyfikacja podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader/ie2:Traderid" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceCustomsOffice">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      8 URZĄD Miejsce dostawy – Urząd celny
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8a Numer referencyjny urzędu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:DeliveryPlaceCustomsOffice/ie2:ReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    9 Dokument e-AD
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">9a Lokalny numer referencyjny</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:EadDraft/ie2:LocalReferenceNumber" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">9b Numer faktury</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:EadDraft/ie2:InvoiceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">9c Data faktury</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:EadDraft/ie2:InvoiceDate" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">9d Kod rodzaju miejsca pochodzenia rozpoczęcia przemieszczenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:EadDraft/ie2:OriginTypeCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">9e Data wysyłki</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:EadDraft/ie2:DateOfDispatch" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">9f Czas wysyłki</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:EadDraft/ie2:TimeOfDispatch" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery//ie2:CompetentAuthorityDispatchOffice">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      10 URZĄD – Właściwy urząd w miejscu wysyłki
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">10a Numer referencyjny urzędu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:CompetentAuthorityDispatchOffice/ie2:ReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    11 Gwarancja dotycząca przemieszczenia
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">11a Kod rodzaju gwaranta</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery//ie2:MovementGuarantee/ie2:GuarantorTypeCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:for-each select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:MovementGuarantee/ie2:GuarantorTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      12 PODMIOT Gwarant
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12a Numer akcyzowy podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:TraderExciseNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12b Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12c Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12d Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12e Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12f Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12g Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">12h Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    13 Transport
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">13a Kod rodzaju transportu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportMode/ie2:TransportModeCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfDelivery//ie2:TransportArrangerTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      14 PODMIOT Organizator transportu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">14a Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportArrangerTrader/ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">14b Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportArrangerTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">14c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportArrangerTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">14d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportArrangerTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">14e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportArrangerTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">14f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportArrangerTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">14g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportArrangerTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    15 PODMIOT Pierwszy przewoźnik
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">15a Numer VAT</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:FirstTransporterTrader/ie2:VatNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">15b Nazwa podmiotu gospodarczego</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:FirstTransporterTrader/ie2:TraderName" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">15c Ulica</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:FirstTransporterTrader/ie2:StreetName" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">15d Numer domu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:FirstTransporterTrader/ie2:StreetNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">15e Kod pocztowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:FirstTransporterTrader/ie2:Postcode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">15f Miejscowość</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:FirstTransporterTrader/ie2:City" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">15g Kod języka</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:FirstTransporterTrader/@language" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:for-each select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:TransportDetails">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      16 Szczegóły dotyczące transportu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">16a Kod jednostki transportowej</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:TransportUnitCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
              <xsl:for-each select="ie2:Body/ie2:SubmittedDraftOfDelivery/ie2:BodyEad">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      17 e-AD Wyroby
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17a Numer identyfikacyjny pozycji towarowej</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:BodyRecordUniqueReference" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17b Kod wyrobu akcyzowego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ExciseProductCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17c Kod CN</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:CnCode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17d Ilość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Quantity" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17e Masa brutto</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:GrossWeight" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17f Masa netto</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:NetWeight" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17g Zawartość alkoholu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:AlcoholicStrength" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17h Stopień Plato</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:DegreePlato" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17i Znaki akcyzy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:FiscalMark" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17j Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:FiscalMark/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17k Znak akcyzy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:FiscalMarkUsedFlag" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17l Miejsce pochodzenia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:DesignationOfOrigin" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17m Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:DesignationOfOrigin/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17n Wielkość producenta</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:SizeOfProducer" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17o Gęstość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Density" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17p Opis handlowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:CommercialDescription" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17q Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:CommercialDescription/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17r Marka wyrobów</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:BrandNameOfProducts" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17s Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:BrandNameOfProducts/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17t Oleje opałowe niepodlegające barwieniu i oznaczeniu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:NotColouredAndMarkedFuelOils" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17u Ilość wyrobu w dodatkowej jednostce miary</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:AdditionalQuantity" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17v Maksymalna cena detaliczna za 20 szt. lub 1 kg</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:MaxRetailPrice" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">17w Rodzaj paliwa</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:FuelType" />
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