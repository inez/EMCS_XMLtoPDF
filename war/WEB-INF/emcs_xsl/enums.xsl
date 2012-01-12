<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" 
 xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

	<xsl:template name="KryteriaWyszukiwania">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='1'">
				<xsl:text>ARC</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Marka wyrobu</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='3'">
				<xsl:text>Kategorie przemieszczanych wyrobów</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='4'">
				<xsl:text>Zmiana odbiorcy przesyłki</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='7'">
				<xsl:text>Zmiana przewoźnika</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='8'">
				<xsl:text>Miejscowość odbiorcy</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='9'">
				<xsl:text>Miejscowość wysyłającego</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='10'">
				<xsl:text>Miejscowość gwaranta</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='12'">
				<xsl:text>Miejscowość miejsca dostawy</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='13'">
				<xsl:text>Miejscowość składu podatkowego wysyłki</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='14'">
				<xsl:text>Miejscowość przewoźnika</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='15'">
				<xsl:text>Kod CN wyrobu</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='16'">
				<xsl:text>Data faktury</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='17'">
				<xsl:text>Numer akcyzowy odbierającego</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='18'">
				<xsl:text>Numer akcyzowy wysyłającego</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='19'">
				<xsl:text>Numer akcyzowy gwaranta</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='22'">
				<xsl:text>Numer akcyzowy składu podatkowego miejsca odbioru</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='23'">
				<xsl:text>Numer akcyzowy składu podatkowego miejsca wysyłki</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='25'">
				<xsl:text>Kod wyrobu akcyzowego</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='26'">
				<xsl:text>Czas przewozu</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='27'">
				<xsl:text>Nazwa państwa członkowskiego miejsca odbioru</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='28'">
				<xsl:text>Nazwa państwa członkowskiego miejsca wysyłki</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='29'">
				<xsl:text>Nazwa odbiorcy</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='30'">
				<xsl:text>Nazwa wysyłającego</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='31'">
				<xsl:text>Nazwa gwaranta</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='33'">
				<xsl:text>Nazwa miejsca odbioru</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='34'">
				<xsl:text>Nazwa składu podatkowego miejsca wysyłki</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='35'">
				<xsl:text>Nazwa przewoźnika</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='36'">
				<xsl:text>Numer faktury</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='37'">
				<xsl:text>Kod pocztowy odbiorcy</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='38'">
				<xsl:text>Kod pocztowy wysyłającego</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='39'">
				<xsl:text>Kod pocztowy gwaranta</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='41'">
				<xsl:text>Kod pocztowy miejsca odbioru</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='42'">
				<xsl:text>Kod pocztowy składu podatkowego miejsca wysyłki</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='43'">
				<xsl:text>Kod pocztowy przewoźnika</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='44'">
				<xsl:text>Ilość wyrobów</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='45'">
				<xsl:text>Lokalny numer referencyjny</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='46'">
				<xsl:text>Typ transportu</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='49'">
				<xsl:text>Numer VAT odbiorcy</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='51'">
				<xsl:text>Numer VAT przewoźnika</xsl:text>
			</xsl:when>
            <xsl:when test="$stringIn='52'">
                <xsl:text>Zmiana miejsca przeznaczenia</xsl:text>
            </xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="TakNie">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Tak</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='0'">
				<xsl:text>Nie</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="StatusType">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='X01'">
				<xsl:text>Zaakceptowany</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X02'">
				<xsl:text>Anulowany</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X03'">
				<xsl:text>Dostarczony</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X04'">
				<xsl:text>Przekierowany</xsl:text>
			</xsl:when>
            <xsl:when test="$stringIn='X05'">
                <xsl:text>Odrzucony</xsl:text>
            </xsl:when>
            <xsl:when test="$stringIn='X06'">
                <xsl:text>Podzielony</xsl:text>
            </xsl:when>
			<xsl:when test="$stringIn='X07'">
				<xsl:text>Zamknięty manualnie</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X08'">
				<xsl:text>Odmowa</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X09'">
				<xsl:text>Żaden</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X10'">
				<xsl:text>Częściowa odmowa</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X11'">
				<xsl:text>Eksportowanie</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='X12'">
				<xsl:text>Zaakceptowany do eksportu</xsl:text>
			</xsl:when>
            <xsl:when test="$stringIn='X13'">
                <xsl:text>Przerwany</xsl:text>
            </xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="ReminderMessageType">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Upływ terminu na zmianę miejsca przeznaczenia</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Upływ terminu na przesłanie raportu odbioru</xsl:text>
			</xsl:when>
            <xsl:when test="$stringIn='3'">
                <xsl:text>Upływ terminu na podanie danych Odbiorcy</xsl:text>
            </xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GlobalControlConclusion">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Brak nieprawidłowości</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Stwierdzono rozbieżności</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='3'">
				<xsl:text>Zalecane przerwanie przemieszczenia</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='4'">
				<xsl:text>Nieprawidłowości związane z działaniem siły wyższej</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='5'">
				<xsl:text>Nieprawidłowości powodujące powstanie zobowiązania podatkowego</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="ControlType">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Kontrola fizyczna</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Kontrola dokumentów</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="PerformedControlAction">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='0'">
				<xsl:text>Inne</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Weryfikacja ilości opakowań</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Wyładunek</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='3'">
				<xsl:text>Otworzenie opakowań</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='4'">
				<xsl:text>Kopie dokumentów opatrzono komentarzem</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="UnsatisfactoryReasonCodeType">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='0'">
				<xsl:text>Inne</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Nadmiar</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Niedobór</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='3'">
				<xsl:text>Wyroby uszkodzone</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='4'">
				<xsl:text>Pieczęć naruszona</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="IndicatorOfShortageOrExcess">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='E'">
				<xsl:text>Nadwyżka</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='S'">
				<xsl:text>Niedobór</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="ReportMessageType">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Inicjalny</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Uzupełniający</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='3'">
				<xsl:text>Zatwierdzający</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="ReasonForControl">
		<xsl:param name="stringIn" />
		<xsl:choose>
			<xsl:when test="$stringIn='0'">
				<xsl:text>Inna</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='1'">
				<xsl:text>Losowe rozpoczęcie kontroli</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='2'">
				<xsl:text>Zdarzenie sygnalizowane</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='3'">
				<xsl:text>Na wniosek o wsparcie</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='4'">
				<xsl:text>Na wniosek innego urzedu</xsl:text>
			</xsl:when>
			<xsl:when test="$stringIn='5'">
				<xsl:text>Otrzymany alarm</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text></xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

  <xsl:template name="AR1_ControlType">
    <xsl:param name="stringIn" />
    <xsl:choose>
      <xsl:when test="$stringIn='A'">
        <xsl:text>Rewizja powtórna</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='B'">
        <xsl:text>Pobranie próbek</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='C'">
        <xsl:text>Rewizja - Częściowa</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='D'">
        <xsl:text>Badanie dokumentów</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='I'">
        <xsl:text>Inne</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='K'">
        <xsl:text>Korekta</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='O'">
        <xsl:text>Rewizja - Oględziny</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='P'">
        <xsl:text>Podklasyfikacja towarów wrażliwych</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='Q'">
        <xsl:text>Kontrola substytucyjna szczególna</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='R'">
        <xsl:text>Rewizja - Pełna</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='S'">
        <xsl:text>Towar potencjalnie strategiczny</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='W'">
        <xsl:text>Kontrola substytucyjna</xsl:text>
      </xsl:when>
      <xsl:when test="$stringIn='Z'">
        <xsl:text>Sprawdzenie zamknięć celnych</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>