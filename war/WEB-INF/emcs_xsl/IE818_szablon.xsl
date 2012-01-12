<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="style.xsl" />
    <xsl:template name="IE818" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd818/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
        <xsl:param name="title" />
		  <fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki"><xsl:value-of select="$title" /></xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka"><xsl:value-of select="$title" /></xsl:with-param>
					</xsl:call-template>
					<fo:table xsl:use-attribute-sets="glowna-tabela">
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-header>
						</fo:table-header>
						<fo:table-body>
							<xsl:if test="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:Attributes/ie:DateAndTimeOfValidationOfReportOfReceipt">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">1a Data i czas zatwierdzenia raportu odbioru</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="formatDate">
												<xsl:with-param name="stringIn" select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:Attributes/ie:DateAndTimeOfValidationOfReportOfReceipt"/>
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										2 Przemieszczenie wyrobów akcyzowych dokument e-AD
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ExciseMovementEaad/ie:AadReferenceCode" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ExciseMovementEaad/ie:SequenceNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											3 PODMIOT Odbierający
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ConsigneeTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ConsigneeTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ConsigneeTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ConsigneeTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ConsigneeTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ConsigneeTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3g Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ConsigneeTrader/@language" />
										</fo:block>
									</fo:table-cell>
							</fo:table-row>
							<xsl:if test="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											4 PODMIOT Miejsce dostawy
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4g Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DeliveryPlaceTrader/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DestinationOffice">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											5 URZĄD – Właściwy urząd w miejscu dostawy
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">5a Numer referencyjny urzędu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:DestinationOffice/ie:ReferenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											6 RAPORT Odbioru/Wywozu
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6a Data przybycia wyrobów</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ReportOfReceipt/ie:DateOfArrivalOfExciseProducts" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6b Ogólne wyniki odbioru</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ReportOfReceipt/ie:GlobalConclusionOfReceipt" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6c Informacje dodatkowe</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ReportOfReceipt/ie:ComplementaryInformation" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6d Kod języka</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:ReportOfReceipt/ie:ComplementaryInformation/@language" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="./ie:Body/ie:AcceptedOrRejectedReportOfReceipt/ie:BodyReportOfReceipt">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
											<fo:block>
												7 RAPORT Odbioru/Wywozu – Wyroby
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7a Numer identyfikacyjny pozycji towarowej</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:BodyRecordUniqueReference" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7b Niedobór lub nadwyżka</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:IndicatorOfShortageOrExcess" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7c Stwierdzony  niedobór lub nadwyżka</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:ObservedShortageOrExcess" />
											</fo:block>
										</fo:table-cell>									
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7d Kod wyrobu akcyzowego</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:ExciseProductCode" />
											</fo:block>
										</fo:table-cell>									
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7e Ilość nieprzyjęta</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:RefusedQuantity" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								<xsl:for-each select="ie:UnsatisfactoryReason">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
											<fo:block>
												7.1 Rodzaj zastrzeżeń
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7.1a Rodzaj zastrzeżeń</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:UnsatisfactoryReasonCode" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7.1b Informacje dodatkowe</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:ComplementaryInformation" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
											<fo:block>
												<xsl:call-template name="label">
													<xsl:with-param name="stringIn">7.1c Kod języka</xsl:with-param>
												</xsl:call-template>
												<xsl:value-of select="ie:ComplementaryInformation/@language" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>									
								</xsl:for-each>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block id="last-page_{position()}"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
    <xsl:template name="IE818_2" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE818:V1.51" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
      <xsl:param name="title" />
      <fo:root>
        <xsl:call-template name="ukladA4" />
        <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
          <xsl:call-template name="StopkaStrony">
            <xsl:with-param name="napisStopki">
              <xsl:value-of select="$title" />
            </xsl:with-param>
          </xsl:call-template>
          <fo:flow flow-name="xsl-region-body">
            <xsl:call-template name="naglowek-strony">
              <xsl:with-param name="napisNaglowka">
                <xsl:value-of select="$title" />
              </xsl:with-param>
            </xsl:call-template>
            <fo:table xsl:use-attribute-sets="glowna-tabela">
              <fo:table-column column-width="proportional-column-width(1)"/>
              <fo:table-column column-width="proportional-column-width(1)"/>
              <fo:table-column column-width="proportional-column-width(1)"/>
              <fo:table-column column-width="proportional-column-width(1)"/>
              <fo:table-header>
              </fo:table-header>
              <fo:table-body>
                <xsl:if test="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExportExport/ie2:Attributes/ie2:DateAndTimeOfValidationOfReportOfReceipt">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">1a Data i czas zatwierdzenia raportu odbioru</xsl:with-param>
                        </xsl:call-template>
                        <xsl:call-template name="formatDate">
                          <xsl:with-param name="stringIn" select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:Attributes/ie2:DateAndTimeOfReportOfReceiptExport"/>
                        </xsl:call-template>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      2 Przemieszczenie wyrobów akcyzowych dokument e-AD
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2a Numer ARC</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2b Numer porządkowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ExciseMovementEad/ie2:SequenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      3 PODMIOT Odbierający
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Identyfikacja podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ConsigneeTrader/ie2:Traderid" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ConsigneeTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ConsigneeTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ConsigneeTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ConsigneeTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ConsigneeTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ConsigneeTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <xsl:if test="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        4 PODMIOT Miejsce dostawy
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">4a Identyfikacja podmiotu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader/ie2:Traderid" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">4b Nazwa podmiotu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader/ie2:TraderName" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">4c Ulica</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader/ie2:StreetName" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">4d Numer domu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader/ie2:StreetNumber" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">4e Kod pocztowy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader/ie2:Postcode" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">4f Miejscowość</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader/ie2:City" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">4g Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DeliveryPlaceTrader/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <xsl:if test="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DestinationOffice">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        5 URZĄD – Właściwy urząd w miejscu dostawy
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">5a Numer referencyjny urzędu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:DestinationOffice/ie2:ReferenceNumber" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      6 RAPORT Odbioru/Wywozu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6a Data przybycia wyrobów</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ReportOfReceiptExport/ie2:DateOfArrivalOfExciseProducts" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6b Ogólne wyniki odbioru</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ReportOfReceiptExport/ie2:GlobalConclusionOfReceipt" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6c Informacje dodatkowe</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ReportOfReceiptExport/ie2:ComplementaryInformation" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6d Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:ReportOfReceiptExport/ie2:ComplementaryInformation/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <xsl:for-each select="./ie2:Body/ie2:AcceptedOrRejectedReportOfReceiptExport/ie2:BodyReportOfReceiptExport">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        7 RAPORT Odbioru/Wywozu – Wyroby
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">7a Numer identyfikacyjny pozycji towarowej</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:BodyRecordUniqueReference" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">7b Niedobór lub nadwyżka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:IndicatorOfShortageOrExcess" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">7c Stwierdzony  niedobór lub nadwyżka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:ObservedShortageOrExcess" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">7d Kod wyrobu akcyzowego</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:ExciseProductCode" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">7e Ilość nieprzyjęta</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:RefusedQuantity" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <xsl:for-each select="ie2:UnsatisfactoryReason">
                    <fo:table-row>
                      <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                        <fo:block>
                          7.1 Rodzaj zastrzeżeń
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                      <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                        <fo:block>
                          <xsl:call-template name="label">
                            <xsl:with-param name="stringIn">7.1a Rodzaj zastrzeżeń</xsl:with-param>
                          </xsl:call-template>
                          <xsl:value-of select="ie2:UnsatisfactoryReasonCode" />
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                      <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                        <fo:block>
                          <xsl:call-template name="label">
                            <xsl:with-param name="stringIn">7.1b Informacje dodatkowe</xsl:with-param>
                          </xsl:call-template>
                          <xsl:value-of select="ie2:ComplementaryInformation" />
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                        <fo:block>
                          <xsl:call-template name="label">
                            <xsl:with-param name="stringIn">7.1c Kod języka</xsl:with-param>
                          </xsl:call-template>
                          <xsl:value-of select="ie2:ComplementaryInformation/@language" />
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                  </xsl:for-each>
                </xsl:for-each>
              </fo:table-body>
            </fo:table>
            <fo:block id="last-page_{position()}"/>
          </fo:flow>
        </fo:page-sequence>
      </fo:root>
    </xsl:template>
</xsl:stylesheet>