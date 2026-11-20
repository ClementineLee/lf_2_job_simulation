defmodule Lf2JobSimulationWeb.PageController do
  use Lf2JobSimulationWeb, :controller

  def home(conn, params) do
    userdata = get_session(conn, :userdata)

    render(conn, :home,
      body: [
        [
          "Willkommen bei der RAM ist COOL GMBH",
          "Wir sind eine Gruppe aus drei Expert*innen (Vertrau mir, Bruder) und verkaufen RAM-Module sowie Grafikkarten mit integriertem Videospeicher (VRAM).",
          "Schön, dass Sie sich für unser Unternehmen interessieren. Bevor Sie bei uns für Mindestlohn arbeiten dürfen, müssen Sie uns, und vor allem sich selbst, allerdings beweisen, dass Sie das Zeug zum Verkauf haben."
        ],
        [
          "Warum wir einen sicheren Arbeitsplatz bieten können",
          "Ist man ein wenig belesen in der aktuellen Marktforschung (und wir sind sehr belesen), so stößt man auf das Wort „RAM-Krise“.",
          "Damit ist die angespannte Situation auf dem Speichermarkt gemeint, in der die Preise für bestimmte RAM-Produkte teilweise drastisch gestiegen sind.",
          "Ein wesentlicher Grund für diese Preisentwicklung ist die steigende Nachfrage nach Speicher für KI-Rechenzentren. Unternehmen, die KI-Modelle entwickeln und betreiben, benötigen dafür große Mengen an leistungsfähigem Arbeitsspeicher.",
          "Besonders gefragt ist dabei sogenannter High Bandwidth Memory (HBM). Da die Hersteller ihre Produktionskapazitäten zunehmend auf solche Speicherprodukte ausrichten, kann das Angebot an herkömmlichem RAM knapper werden. Dadurch steigen auch dessen Preise.",
          "Andere Branchen werden also von KI abgelöst, während unsere wächst. Wir brauchen daher jede Menge kluger Köpfe, die unser Unternehmen mit vorantreiben."
        ],
        [
          "Der Bewerbungsablauf",
          "1. Sie haben die Möglichkeit, Ihr Fachwissen mithilfe der von uns bereitgestellten Informationsmaterialien zu festigen.",
          "2. Anschließend dürfen Sie Ihr Wissen mit einem Quiz überprüfen! Keine Sorge, Sie haben beliebig viele Versuche.",
          "3. Haben Sie das Quiz bestanden, wird die Kundensimulation freigeschaltet.",
          "4. Bestehen Sie die Simulation, erhalten Sie ein Jobangebot."
        ]
      ],
      userid: userdata.userid,
      test1: userdata.test1,
      test2: userdata.test2
    )
  end

  def basic_information(conn, params) do
    userdata = get_session(conn, :userdata)

    render(conn, :info_texts,
      body: [
        [
          [
            "Was ist RAM?",
            "RAM: Random Access Memory (Arbeitsspeicher)",
            "Funktion: Die CPU mit Daten laufender Programme versorgen, Ladezeiten verkürzen und Ruckler durch Speichermangel reduzieren.",
            "Eigenschaften: flüchtige Speicherung, schnelle Zugriffszeiten, direkter Zugriff auf einzelne Speicheradressen."
          ],
          [
            "Schematische Darstellung: So arbeiten die Speicher zusammen",
            "[[IMAGE:Bild.jpeg]]",
            "Vereinfachtes Schema: RAM versorgt die CPU."
          ],
          [
            "Ausführliche Erklärung",
            "Die Abkürzung RAM steht für Random Access Memory, auf Deutsch Arbeitsspeicher.",
            "Einen Arbeitsspeicher kann man mit einem Schreibtisch vergleichen, auf dem gerade benötigte Unterlagen und Arbeitsmaterialien liegen.",
            "Im Arbeitsspeicher befinden sich meist Daten und Programme, die gerade verwendet werden.",
            "Die Daten werden in diesem Speicher abgelegt und können mit sehr kurzen Zugriffszeiten abgerufen werden.",
            "Das sorgt für ein flüssigeres Nutzererlebnis und kann Ladezeiten sowie Ruckler reduzieren, insbesondere wenn zuvor ein Mangel an Arbeitsspeicher bestand.",
            "Anders als eine SSD oder Festplatte ist RAM ein flüchtiger Speicher. Das bedeutet, dass die Daten ohne Stromversorgung verloren gehen. SSDs und Festplatten speichern Daten dagegen dauerhaft.",
            "Die meisten CPUs können ohne RAM nicht sinnvoll betrieben werden. Ein Verzicht auf Arbeitsspeicher ist praktisch unmöglich.",
            "Eine modernere DDR5-RAM im Dual-Channel-Modus ist etwa 10-15 mal schneller, als eine herkömmliche SATA-SSD."
          ]
        ],
        [
          [
            "Welche Arten und Generationen von RAM gibt es?",
            "Arten:",
            "DRAM (Dynamic Random Access Memory): Speichert Daten in kleinen Kondensatoren. Muss regelmäßig aufgefrischt werden. Wird als Hauptarbeitsspeicher (RAM) in PCs und Laptops verwendet.",
            "SRAM (Static Random Access Memory): Speichert Daten mithilfe von Transistoren. Benötigt keine regelmäßige Auffrischung, ist besonders schnell, aber teurer und benötigt mehr Platz pro gespeichertem Bit.",
            "Generationen:",
            "DDR (Double Data Rate): Eine Technik zur Datenübertragung, bei der pro Taktzyklus zwei Datenübertragungen stattfinden.",
            "DDR-Generationen: DDR, DDR2, DDR3, DDR4 und DDR5. Jede Generation bringt technische Verbesserungen mit sich.",
            "Wichtig:",
            "DRAM und SRAM beschreiben unterschiedliche Speichertechnologien. DDR4 und DDR5 sind dagegen Generationen einer DRAM-Technologie."
          ],
          [
            "Für den Verkauf wichtig zu wissen",
            "Wenn Kunden nach Arbeitsspeicher für ihren PC fragen, meinen sie normalerweise DRAM in Form eines DDR-RAM-Moduls.",
            "Sofern ein System Unified Memory verwendet, ist eine Aufrüstung häufig schwierig oder unmöglich, da der Speicher je nach Bauweise fest verlötet oder direkt in das Chip-Paket integriert ist.",
            "Vor dem Verkauf muss geprüft werden, ob das Mainboard DDR4 oder DDR5 unterstützt. Die beiden Generationen können nicht gegeneinander ausgetauscht werden.",
            "Eine neuere DDR-Generation ist nicht automatisch mit jedem älteren Computer kompatibel. Auch die unterstützte Geschwindigkeit und Speicherkapazität müssen berücksichtigt werden.",
            "Sofern ein System Unified Memory verwendet, ist eine Aufrüstung häufig schwierig oder unmöglich, da der Speicher je nach Bauweise fest verlötet oder direkt in das Chip-Paket integriert ist."
          ],
          [
            "Beispielbilder",
            "DRAM:",
            "[[IMAGE:dram-speicher-1.jpg]]",
            "https://de.minitool.com/bib/dram-speicher.html",
            "SRAM:",
            "[[IMAGE:A200_DIL-32.jpg]]",
            "https://www.reichelt.de/de/de/shop/produkt/sram_1_mb_128_k_x_8_5_v_55ns_dil-32-146552",
            "DDR-Generationen:",
            "[[IMAGE:Physic-Size-of-DDR-DDR2-DDR3-DDR4-and-DDR5.webp]]",
            "https://www.diskmfr.com/understanding-ram-compatibility-brands-and-frequencies/?utm_source=chatgpt.com"
          ],
          [
            "Ausführliche Erklärung",
            "Grundsätzlich unterscheidet man beim Arbeitsspeicher zwischen DRAM und SRAM. Beide Speicherarten können Daten kurzfristig speichern, unterscheiden sich jedoch in ihrem technischen Aufbau und ihren Eigenschaften.",
            "DRAM steht für Dynamic Random Access Memory. Bei dieser Speicherart wird jedes einzelne Bit mithilfe eines Transistors und eines Kondensators gespeichert. Der Kondensator hält eine elektrische Ladung, die den gespeicherten Wert repräsentiert. Da diese Ladung mit der Zeit verloren geht, müssen die gespeicherten Daten regelmäßig aufgefrischt werden. Diesen Vorgang nennt man Refresh.",
            "DRAM kann vergleichsweise günstig hergestellt werden und bietet eine hohe Speicherdichte. Das bedeutet, dass auf wenig Platz große Datenmengen gespeichert werden können. Deshalb wird DRAM als Hauptarbeitsspeicher in den meisten PCs, Laptops und Servern eingesetzt.",
            "SRAM steht für Static Random Access Memory. Anders als DRAM verwendet SRAM mehrere Transistoren pro gespeichertem Bit. Die Daten bleiben dadurch erhalten, solange die Stromversorgung besteht. Eine regelmäßige Auffrischung wie bei DRAM ist nicht notwendig.",
            "SRAM ist besonders schnell und hat sehr kurze Zugriffszeiten. Allerdings benötigt er mehr Platz auf dem Chip und ist deutlich teurer in der Herstellung. Deshalb wird er normalerweise nicht als großer Hauptarbeitsspeicher verwendet, sondern beispielsweise als Cache direkt im Prozessor. Dort speichert er besonders häufig benötigte Daten, damit die CPU möglichst schnell darauf zugreifen kann.",
            "Die bekannten RAM-Module, die man in einen PC einbaut, basieren auf DRAM. Dabei gibt es verschiedene Generationen der DDR-Technologie.",
            "DDR steht für Double Data Rate. Diese Technik ermöglicht zwei Datenübertragungen pro Taktzyklus. Im Laufe der Zeit wurden verschiedene Generationen entwickelt: DDR, DDR2, DDR3, DDR4 und DDR5. Jede neue Generation bringt technische Veränderungen mit sich, beispielsweise höhere mögliche Datenraten und eine verbesserte Energieeffizienz.",
            "Die verschiedenen DDR-Generationen sind nicht untereinander austauschbar. Sie unterscheiden sich unter anderem in ihrer Bauform, Pinbelegung und ihren elektrischen Eigenschaften. Das Mainboard und der Prozessor müssen die jeweilige Generation unterstützen."
          ]
        ],
        [
          [
            "VRAM - Der Speicher der Grafikkarte",
            "VRAM: Video Random Access Memory",
            "Funktion: Arbeitsspeicher der Grafikkarte, Versorgt GPU mit Grafikdaten",
            "Eigenschaften: Siehe RAM, Je nach Anwendung als eigenständiges Modul in externer Grafikkarte, oder integriert in RAM, notwendig für alle Systeme, die eine GPU besitzen."
          ],
          [
            "Schematische Darstellung: So arbeiten die Speicher zusammen",
            "[[IMAGE:Bild 2.jpeg]]",
            " Für Grafikberechnungen nutzt eine separate Grafikkarte eigenen VRAM, integrierte Grafik
            dagegen gemeinsam genutzten RAM."
          ],
          [
            "Vergleich RAM vs VRAM",
            "Gemeinisamkeiten:",
            "Flüchtiger Speicher",
            "schnelle Laufzeit",
            "Unterschiede:",
            "Gespeicherte Daten:",
            "VRAM speichert Grafikdaten, wie Texturen, Bilder, Bilddaten und 3D Modelle",
            "RAM speichert Daten für laufende Programme",
            "Einsatzbereich:",
            "VRAM versorgt Grafikprozessor (GPU)",
            "RAM versorgt Hauptprozessor (CPU)",
            ""
          ],
          [
            "Dedizierter VRAM vs Shared Memory vs Unified Memory",
            "Dedizierter VRAM:",
            "VRAM und RAM sind eigene Speicherchips",
            "GPU hat direkten Zugriff auf VRAM",
            "Bandbreite: Sehr hoch",
            "Speicheraufteilung: RAM und VRAM getrennt",
            "Datenkopien zwischen CPU und CPU: teilweise erforderlich",
            ".",
            "Gemeinsamkeiten Shared Memory und Unified Memory:",
            "CPU und GPU greifen auf selben Arbeitsspeicher zu",
            "Speicher wird für Anwendungen reserviert",
            ".",
            "Unterschiede Shared Memory und Unified Memory:",
            "Unified Memory ist darauf ausgelegt, dass RAM und VRAM gemeinsam auf einen Arbeitsspeicher zugreifen.",
            "Durch die spezielle Architektur werden Datenkopien zwischen GPU und CPU oft vermieden.",
            "Dadurch kann die Bandbreite ebenfalls sehr hoch sein",
            "Die Bandbreite beim Shared Memory ist gegensetzlich eher gering.",
            "Jedoch ist eine Aufrüstung mit einer Grafikkarte mit VRAM im Regelfall möglich.",
            "Unified Memories sind im Regelfall nicht aufrüstbar.",
            "Apple nutzt häufig Unified Memories für seine Computer und Laptops"
          ],
          [
            "Geschwindigkeiten im Vergleich: SSD, RAM und VRAM",
            "[[IMAGE:velocity.png]]",
            "Die Zahlen zeigen unterschiedliche Aufgaben: RAM ermöglicht schnelle CPU-Zugriffe, VRAM hohe Bandbreite für die GPU. *VRAM-Beispiel:
            Radeon RX 9070 XT (16 GB GDDR6, laut AMD bis 640 GB/s). Zugriffszeiten von VRAM und RAM sind hier nicht direkt vergleichbar.",
            "**NVIDIA GeForce RTX 5090 (schnellste Grafikkarte im Consumer Bereich). Bei speziellen Grafikkarten für Rechenzentren können über
            20TB/s erreicht werden. (z.B HBM4)"
          ],
          [
            "Für den Verkauf wichtig zu wissen",
            "VRAM erreicht häufig besonders hohe Bandbreiten, da bei Grafikberechnungen sehr viele Daten schnell verarbeitet werden müssen.",
            "Externe VRAMs sind besonders für Gaming PCs wichtig.",
            "So ist ein Leistungsstarkes Spielerlebnis, ohne Nachladeruckler und ohne Grafikeinbußen möglich.",
            "Für Gaming 8-12 GB sinnvoll",
            "Anspruchsvolle Anwendungen 16GB oder mehr Sinnvoll",
            "Weitere Beispiele für hohen VRAM Bedarf: ",
            "Videoschnitt, Bildberarbeitung, Animationen, VR",
            "Ebenfalls wichtig: Kompaktibilität und Leistung von GPU",
            "Server brauchen im Regelfall keine GPU und somit auch kein VRAM",
            "Allerdings sind KI und Spiele Server häufig auf Grafikberechnungen angewiesen. Daher sind in diesem Fall sehr Leistungsstarke VRAMs Notwendig. "
          ],
          [
            "Beispielbild",
            "Externe Grafikkarte:",
            "[[IMAGE:vram_152.webp]]",
            "https://techterms.com/de/definition/vram"
          ],
          [
            "Ausführliche Erklärung:",
            "VRAM steht für Video Random Access Memory und bezeichnet den speziellen Arbeitsspeicher einer Grafikkarte. Er übernimmt eine ähnliche Aufgabe wie der normale Arbeitsspeicher (RAM), ist jedoch gezielt auf die Anforderungen der Grafikverarbeitung ausgelegt. Während der RAM hauptsächlich Daten und Programme für den Hauptprozessor (CPU) bereithält, versorgt der VRAM den Grafikprozessor (GPU) mit den benötigten Grafikdaten.",
            "Im VRAM werden beispielsweise Texturen, Bilder, 3D-Modelle und weitere grafische Informationen gespeichert, die für die Berechnung und Darstellung auf dem Bildschirm benötigt werden. Dadurch kann die GPU schnell auf diese Daten zugreifen, ohne sie ständig aus dem normalen Arbeitsspeicher laden zu müssen. Das ist besonders bei aufwendigen Spielen und grafischen Anwendungen wichtig, bei denen große Datenmengen verarbeitet werden müssen.",
            "Wie der normale RAM handelt es sich auch beim VRAM um einen flüchtigen Speicher. Die gespeicherten Daten bleiben also nur erhalten, solange die Stromversorgung besteht. Bei dedizierten Grafikkarten befindet sich der VRAM in Form eigener Speicherchips direkt auf der Grafikkarte und ist über eine schnelle Speicheranbindung mit der GPU verbunden. Integrierte Grafikeinheiten besitzen dagegen häufig keinen eigenen Grafikspeicher, sondern verwenden einen Teil des normalen Arbeitsspeichers. Dieser gemeinsam genutzte Speicher steht dann nicht mehr vollständig für andere Programme zur Verfügung.",
            "Obwohl RAM und VRAM ähnliche grundlegende Eigenschaften besitzen, unterscheiden sie sich durch ihren jeweiligen Einsatzzweck. Der RAM stellt der CPU Daten für das Betriebssystem und laufende Programme zur Verfügung. Der VRAM übernimmt dagegen die Bereitstellung grafischer Daten für die GPU. Beide Speicherarten arbeiten dabei zusammen: Bei einem Computerspiel befinden sich beispielsweise Programm- und Spieldaten im normalen RAM, während benötigte Texturen und andere Grafikdaten im VRAM bereitgestellt werden.",
            "Die Größe des VRAM ist insbesondere bei Gaming-PCs ein wichtiges Kaufkriterium. Je höher die Bildschirmauflösung und die gewählten Grafikeinstellungen sind, desto mehr Grafikspeicher kann benötigt werden. Auch besonders detaillierte Texturen und komplexe 3D-Umgebungen erhöhen den Speicherbedarf. Ist der VRAM zu klein, müssen Daten teilweise in den normalen Arbeitsspeicher ausgelagert werden. Da dieser nicht für die direkte Grafikverarbeitung ausgelegt ist, kann das zu Nachladerucklern, längeren Ladezeiten und Einschränkungen bei der Grafikqualität führen.",
            "Als grobe Orientierung können für Gaming je nach Anforderungen 8 bis 12 GB VRAM sinnvoll sein. Für anspruchsvolle Spiele mit hohen Auflösungen oder besonders hohen Grafikeinstellungen können 16 GB oder mehr empfehlenswert sein. Auch professionelle Anwendungen wie Videoschnitt, Bildbearbeitung, 3D-Modellierung, Animationen und Virtual Reality können große Mengen an Grafikspeicher benötigen.",
            "Beim Kauf einer Grafikkarte sollte allerdings nicht ausschließlich auf die Größe des VRAM geachtet werden. Entscheidend ist auch die Leistungsfähigkeit der GPU selbst, da zusätzlicher Grafikspeicher eine schwache Grafikkarte nicht automatisch schneller macht. Ebenso spielen die Speicheranbindung und die allgemeine Architektur eine wichtige Rolle. Darüber hinaus muss die Grafikkarte zum vorhandenen Computersystem passen. Dazu gehören unter anderem die Stromversorgung, der verfügbare Platz im Gehäuse und die Kompatibilität mit dem Mainboard."
          ]
        ],
        [
          [
            "Weitere Informationen und Quellen",
            "Crucial: „What does computer memory do?“ – test.crucial.com/articles/about-memory/support-what-does-computer-memory-do",
            "Kingston: „DDR4 vs DDR5 DRAM“ – kingston.com/blog/pc-performance/ddr-memory-generation-differences",
            "NVIDIA: GeForce-RTX-50-Serie, technische Daten / Bandbreite – nvidia.com/de-de/geforce/graphics-cards/50-series",
            "AMD: Radeon RX 9070 XT, GDDR6 / Bandbreite – amd.com/de/products/specifications/graphics.html",
            "Grafikkartenpreise (12./13.11.2026): Geizhals.de – ASRock RX 7600 8 GB, MSI RTX 5070 12 GB, ASUS Prime RX 9070 XT 16 GB.",
            "Apple: „Apple unleashes M1“ (Unified Memory) – apple.com/newsroom/2020/11/apple-unleashes-m1/",
            "Preis- und Systembeispiele für RAM: Unterrichtsmaterial (Vorjahresgruppe)."
          ]
        ]
      ],
      userid: userdata.userid,
      test1: userdata.test1,
      test2: userdata.test2
    )
  end

  def impressum(conn, params) do
    userdata = get_session(conn, :userdata)

    render(conn, :home,
      body: [
        [
          "Impressum",
          "Angaben gemäß §5 DDG",
          "RAM ist COOL GmbH"
        ],
        [
          "Anschrift:",
          "RAM ist COOL GmbH",
          "Mammon Lane 1000, 16161 Springfield",
          "Deutschland"
        ],
        [
          "Vertreten durch:",
          "Geschäftsführer: Charles Montgomery Burns"
        ],
        ["Kontakt:", "E-Mail: info@ram_ist_cool.de", "Telefonnummer: 0161 32168"],
        [
          "Registereintrag",
          "Eintragung im Handelsregister",
          "Registergericht: Amtsgerict Springfield",
          "Registernummer: HRB 4242"
        ],
        [
          "Umsatzsteuer-ID:",
          "Umsatzsteuer-Identifikationsnummer gemäß § 27a UStG:",
          "DE123456789"
        ],
        [
          "Verantwortlich für den Inhalt: ",
          "Niemand will hier stehen, drum bitte lieb sein und nicht klagen. Dankö"
        ]
      ],
      userid: userdata.userid,
      test1: userdata.test1,
      test2: userdata.test2
    )
  end

  def quiz(conn, params) do
    userdata = get_session(conn, :userdata)

    options = Lf2JobSimulation.UserStore.get_options(:options_test_1)

    map_saver = Lf2JobSimulation.UserStore.get_user(userdata.userid)
    result_quiz = Map.get(map_saver, :test1_result, %{})

    render(conn, :quiz,
      userid: userdata.userid,
      test1: userdata.test1,
      test2: userdata.test2,
      result_quiz: result_quiz,
      options: options
    )
  end

  def result_quiz(conn, params) do
    userdata = get_session(conn, :userdata)
    IO.inspect(params, label: "params")
    options = Lf2JobSimulation.UserStore.get_options(:options_test_1)

    given_results =
      params

    right_answers =
      %{
        "single_choise_question_1" => "Ungefähr 10- bis 15-mal schneller",
        "single_choise_question_2" =>
          "Benötigte Daten müssen teilweise auf den langsameren Massenspeicher ausgelagert werden, wodurch Verzögerungen entstehen können.",
        "single_choise_question_3" =>
          "Weil die gespeicherte elektrische Ladung in den Kondensatoren mit der Zeit verloren geht.",
        "single_choise_question_4" =>
          "Er verdoppelt nahezu die Bandbreite, weil die CPU auf zwei Riegel gleichzeitig zugreift.",
        "single_choise_question_5" =>
          "Weil VRAM extrem hohe Bandbreiten bietet, um 3D-Modelle und Texturen ohne Verzögerung an die GPU zu liefern.",
        "text_answer1" => "Kurzspeicher",
        "text_answer2" => "temporär",
        "text_answer3" => "verloren",
        "text_answer4" => "CPU",
        "text_answer5" => "DDR5",
        "text_answer6" => "Double Data Rate",
        "truth_false_question_1" => "Falsch",
        "truth_false_question_2" => "Wahr",
        "truth_false_question_3" => "Falsch"
      }

    result_quiz =
      Enum.reduce(right_answers, %{points: 0}, fn {question, right_answer}, acc ->
        answer = Map.get(params, question, "wurde leider nicht ausgefüllt")

        is_right = answer == right_answer

        points = if is_right, do: acc.points + 1, else: acc.points

        acc
        |> Map.put(question, %{
          is_right: is_right,
          answer: answer,
          right_answer: right_answer
        })
        |> Map.put(:points, points)
      end)

    points = Map.get(result_quiz, :points)

    conn =
      if points >= 8 do
        Lf2JobSimulation.UserStore.update_user_results_test_one(
          userdata.userid,
          true,
          userdata.test2,
          result_quiz
        )

        userdata =
          get_session(conn, :userdata)
          |> Map.put(:test1, true)

        assign(conn,
          result_quiz: result_quiz,
          userid: userdata.userid,
          test1: userdata.test1,
          test2: userdata.test2,
          options: options
        )
        |> put_session(:userdata, userdata)
        |> put_flash(:clear_autosave, "true")
        |> put_flash(
          :info,
          "Herzlichen Glückwunsch. Sie haben den Test bestanden. Beraten Sie nun Ihren ersten Kunden."
        )
      else
        userdata =
          get_session(conn, :userdata)

        conn =
          assign(conn,
            result_quiz: %{},
            userid: userdata.userid,
            test1: userdata.test1,
            test2: userdata.test2,
            options: options
          )
          |> put_flash(:clear_autosave, "true")
          |> put_flash(:info, "Leider haben Sie nicht bestanden. Bitte versuchen Sie es nochmal.")
      end

    IO.inspect(result_quiz)

    render(conn, :quiz)
  end

  def product_information(conn, params) do
    userdata = get_session(conn, :userdata)

    render(conn, :home,
      body: [["Moin", " Was geht"]],
      userid: userdata.userid,
      test1: userdata.test1,
      test2: userdata.test2
    )
  end

  def simulation(conn, params) do
    userdata = get_session(conn, :userdata)

    conn =
      if userdata.test2 == true do
        render(conn, :home,
          body: [
            [
              "Herzlichen Glückwunsch",
              " Sie haben unser Bewerbungsverfahren bestanden. Sie dürfen jetzt bei uns für Mindestlohn arbeiten."
            ]
          ],
          userid: userdata.userid,
          test1: true,
          test2: true
        )
      else
        render(conn, :simulation,
          body: [["Moin", " Was geht"]],
          userid: userdata.userid,
          test1: userdata.test1,
          test2: userdata.test2
        )
      end
  end

  def simulation_result(conn, params) do
    userdata = get_session(conn, :userdata)

    product_answer = Map.get(params, "product_answer", "")

    test2 =
      if(
        product_answer == "RAM Basic" or
          product_answer == "RAM Allrounder"
      ) do
        Lf2JobSimulation.UserStore.update_user_results_test_two(userdata.userid)
        true
      else
        false
      end

    render(conn, :home,
      body: [
        [
          "Herzlichen Glückwunsch",
          " Sie haben unser Bewerbungsverfahren bestanden. Sie dürfen jetzt bei uns für Mindestlohn arbeiten."
        ]
      ],
      userid: userdata.userid,
      test1: true,
      test2: test2
    )

    assign(conn,
      test2: test2
    )

    conn
  end

  def reset_session(conn, params) do
    userdata = get_session(conn, :userdata)

    Lf2JobSimulation.UserStore.reset_user(userdata.userid)

    userdata =
      Map.put(userdata, :userid, userdata.userid)
      |> Map.put(:test1, false)
      |> Map.put(:test2, false)

    conn
    |> put_session(:userdata, userdata)
    |> redirect(to: ~p"/")
  end
end
