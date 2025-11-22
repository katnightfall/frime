if not Locale then
    Locale = {}
end

Locale["pl"] = {
    announcement = {
        description = "Przeglądaj ogłoszenie #{id}",
        remove = "Usuń ogłoszenie",
        remove_warning_description = "Czy na pewno chcesz usunąć to ogłoszenie?",
        title = "Ogłoszenie",
        edit = {
            error = "Wystąpił błąd podczas edytowania ogłoszenia.",
            label = "Edytuj",
            success = "Poprawnie zapisano edycję ogłoszenia #{id}!"
        }
    },
    announcements = {
        create = "Twórz",
        description = "Przeglądaj i twórz ogłoszenia!",
        preview = "Przeglądaj",
        title = "Ogłoszenia",
        form = {
            content = {
                label = "Treść ogłoszenia",
                rule = "Minimalna ilość znaków to {minLength}!"
            },
            title = {
                label = "Tytuł",
                placeholder = "Wprowadź tytuł ogłoszenia...",
                rule = "Tytuł ogłoszenia jest wymagany!"
            }
        }
    },
    citizen = {
        accounts = "Konta bankowe",
        description = "Przeglądaj profil obywatela",
        title = "Obywatel",
        vehicles = "Pojazdy",
        cases = {
            search = "Szukaj po nazwie...",
            title = "Sprawy"
        },
        info = {
            dob = "Data urodzenia",
            dob_format = "{dob} ({dob_calculated} lat)",
            gender = "Płeć",
            name = "Imię i Nazwisko",
            nationality = "Narodowość",
            licenses = {
                title = "Licencje",
                confirm_give = "Czy na pewno chcesz przyznać obywatelowi licencję {license}?",
                confirm_take = "Czy na pewno chcesz odebrać obywatelowi licencję {license}?",
                notification = {
                    error = "Wystąpił błąd podczas zarządzania licencją!",
                    success = "Poprawnie zaktualizowano licencję!"
                }
            }
        }
    },
    citizens = {
        description = "Przeglądaj i wyszukuj obywateli",
        search = "Szukaj obywatela...",
        title = "Obywatele",
        filters = {
            gender = "Płeć",
            gender_female = "Kobieta",
            gender_male = "Mężczyzna"
        }
    },
    finances = {
        account = {
            description = "Przeglądaj informacje o koncie.",
            title = "Konto {id}",
            info = {
                balance = "Saldo",
                created_at = "Stworzone dnia",
                name = "Nazwa konta",
                note = "Notatka",
                note_placeholder = "Podaj treść notatki...",
                number = "Numer konta",
                owner = 'Właściciel konta',
                history = {
                    title = "Historia - łącznie {total}",
                    id = "ID",
                    from = "Od",
                    to = "Do",
                    date = "Data",
                    amount = "Kwota",
                    desc = "Tytuł",
                    current = "Bieżące"
                }
            }
        },
        transaction = {
            description = "Przeglądaj informacje o transakcji.",
            title = "Transakcja #{id}",
            info = {
                amount = "Kwota",
                date = "Data",
                from = "Od",
                note = "Notatka",
                note_placeholder = "Podaj treść notatki...",
                title = "Transakcje",
                to = "Do",
                history = {
                    title = "Historia - łącznie {total}",
                    id = "ID",
                    from = "Od",
                    to = "Do",
                    date = "Data",
                    amount = "Kwota",
                    desc = "Tytuł",
                    current = "Bieżące"
                }
            }
        },
        transactions = {
            exportmodal = {
                error = "Wystąpił błąd podczas eksportowania transakcji.",
                account = {
                    label = "Konto bankowe",
                    placeholder = "Wybierz konto do eksportu...",
                    required = "Wybierz konto!"
                },
                date = {
                    label = "Zakres dat",
                    required = "Wypełnij poprawnie datę początkową i końcową"
                },
                success = {
                    description = "Poprawnie wyeksportowano transakcje! Odwiedź poniższy link.",
                }
            }
        }
    },
    form = {
        title = "Dokument #{id}",
        print = {
            connecting = "Nawiązywanie połączenia...",
            error = "Wystąpił błąd podczas drukowania!",
            printingPage = "Drukowanie... ({current}/{total})",
            title = "Drukowanie dokumentu",
            select = {
                label = "Drukarka",
                placeholder = "Wybierz drukarkę...",
                required = "To pole jest wymagane!"
            }
        }
    },
    forms = {
        description = "Przeglądaj i twórz dokumenty.",
        created_at = "Stworzone {date}",
        search = 'Szukaj dokumentów...',
        title = "Dokumenty"
    },
    global = {
        attention = "Uwaga!",
        cancel = "Anuluj",
        confirm = "Potwierdź",
        no = "Nie",
        no_perms = "Brak uprawnień!",
        no_perms_title = "Nie posiadasz uprawnień, aby wykonać tą akcję",
        save = "Zapisz",
        ssn = "SSN/CitizenID",
        submit = "Wyślij",
        wanted = "POSZUKIWANY",
        warning = "Uwaga",
        yes = "Tak",
        filters = {
            no_filter = "Brak filtra",
            not_wanted = "Nie poszukiwany",
            wanted = "Poszukiwany"
        },
        form = {
            max_error = "Maksymalna ilośc znaków to {number}",
            min_error = "Minimalna ilośc znaków to {number}"
        },
        no_result = {
            title = "Brak wyników",
            subtitle = "Nie znaleziono wyników dla tego zapytania"
        },
        notifications = {
            error = "Błąd",
            info = "Informacja",
            success = "Sukces",
            warning = "Ostrzeżenie"
        },
        sort = {
            ascending = "rosnąco",
            descending = "malejąco",
            name_asc = "Imię rosnąco",
            name_desc = "Imię malejąco",
            random = "Losowo",
            relevance = "Trafność"
        }
    },
    homepage = {
        description = "Witaj na stronie głównej MDT!",
        title = "Strona główna",
        chat = {
            description = "Chatuj pomiędzy innymi urzędnikami!",
            no_messages = "Brak wiadomości",
            send = "Wyślij wiadomość...",
            title = "Chat",
            no_perms = "Nie posiadasz uprawnień do wysyłania wiadomości!"
        },
        clerks = {
            description = "Przeglądaj innych urzędników na służbie!",
            title = "Urzędnicy na służbie"
        },
        profile = {
            no_result = "Nie znaleziono informacji o twoim profilu!",
            subtitle = "Przeglądaj informacje o sobie",
            title = "Twój Profil",
            data = {
                grade = "Stanowisko:",
                session_time = "Czas na służbie:",
                status = "Status:",
                total_time = "Łączny czas na służbie:"
            },
        },
        search = {
            description = "Szukaj po obywatelach, pojazdach, notatkach, dokumentach, kontach lub transakcjach.",
            search = "Szukaj...",
            title = "Szybka wyszukiwarka",
            no_perms = "Nie masz uprawnień do korzystania z wyszukiwarki.",
            no_input = {
                title = "Brak wprowadzonego zapytania",
                subtitle = "Wpisz frazę, aby rozpocząć wyszukiwanie."
            },
            not_found = {
                title = "Brak wyników",
                subtitle = "Nie znaleziono żadnych wyników pasujących do wyszukiwania."
            }
        }
    },
    management = {
        description = "Zarządzaj pracownikami i finansami DOJ",
        title = "Zarządzanie",
        employees = {
            search = "Szukaj pracowników...",
            changerank = {
                error = "Wystąpił nieznany błąd podczas zmiany stopnia.",
                success = "Poprawnie zmieniono stopień!",
                title = "Zmiana stopnia",
                descriptions = {
                    duty_enter = "Wejście na służbę",
                    duty_leave = "Zejście ze służby. Łącznie spędzono: {total}",
                    promote = "Zmiana stopnia, ({from} -> {to})",
                    hire = "Zatrudnienie"
                },
                grade = {
                    error = "Stopień jest wymagany",
                    label = "Nowy stopień",
                    placeholder = "Podaj nowy stopień",
                },
                reason = {
                    label = "Powód",
                    placeholder = "Podaj powód",
                },
            },
            employee = {
                changerank = "Zmień stopień",
                fire = "Zwolnij",
                history = "Historia",
                manage = "Zarządzaj",
                status = "Status",
                offline = "Offline",
                online = "Online",
                session_duty = "Czas na służbie",
                total_duty = "Łączny czas na służbie",
                hired_at = "Zatrudniony dnia",
                last_promoted = "Ostatnio awansowany"
            },
            fire = {
                error = "Wystąpił błąd podczas zwalniania pracownika.",
                success = "Poprawnie zwolniono pracownika",
                title = "Zwolnij pracownika",
                reason = {
                    error = "Podaj powód",
                    label = "Powód",
                },
            },
            hire = {
                success = "Poprawnie zatrudniono pracownika!",
                title = "Zatrudnij pracownika",
                citizen = {
                    label = "Obywatel",
                    placeholder = "Wybierz osobę do zatrudnienia",
                },
                errors = {
                    default = "Wystąpił błąd podczas zatrudniania pracownika",
                    offline = "Obywatel jest offline!",
                    self = "Nie możesz zatrudnić samego siebie!",
                },
            },
            history = {
                date = "Data",
                description = "Opis",
                id = "ID",
            },
        },
        finances = {
            balance = {
                deposit = "Wpłać",
                withdraw = "Wypłać"
            },
            form = {
                error = "Wystąpił błąd. Spróbuj ponownie",
                amount = {
                    label = "Kwota",
                    placeholder = "Wprowadź kwotę...",
                    required = "Podaj poprawną kwotę!"
                },
                message = {
                    label = "Tytuł",
                    placeholder = "Wprowadź tytuł operacji..."
                }
            },
            transaction = {
                amount = "Kwota",
                author = "Autor",
                date = "Data",
                details = "DODATKOWE INFORMACJE",
                id = "ID",
                message = "Tytuł transakcji",
                type = "Typ"
            },
            transactions = {
                search = "Szukaj transakcji..."
            }
        }
    },
    navigation = {
        homepage = "Strona główna",
        announcements = "Ogłoszenia",
        citizens = "Obywatele",
        vehicles = "Pojazdy",
        notes = "Notatki",
        forms = "Dokumenty",
        finances = "Finanse",
        settings = "Ustawienia",
        management = "Zarządzanie",
        exit = "Wyjdź"
    },
    note = {
        at = "O",
        author = "Autor",
        by = "Przez",
        created_at = "Utworzono",
        delete_confirm = "Czy na pewno chcesz usunąć tę notatkę?",
        description = "Szczegóły notatki",
        details = "Szczegóły",
        last_edited = "Ostatnia edycja",
        title = "Notatka",
    },
    notes = {
        form = {
            error = "Wystąpił błąd podczas wysyłania notatki.",
            citizens = {
                label = "Obywatele",
                placeholder = "Wybierz obywateli...",
                required = "Wybierz przynajmniej jednego obywatela!",
            },
            clerks = {
                label = "Urzędnicy",
                placeholder = "Wybierz urzędników...",
                required = "Wybierz przynajmniej jednego urzędnika!",
            },
            description = {
                label = "Opis",
                required = "Uzupełnij opis!",
            },
            title = {
                label = "Tytuł",
                required = "Uzupełnij tytuł!",
            },
            vehicles = {
                label = "Pojazdy",
                placeholder = "Wybierz pojazdy...",
                required = "Wybierz conajmniej jeden pojazd!",
            },
        },
        page = {
            description = "Przeglądaj i twórz notatki",
            title = "Notatki",
        },
        search = {
            placeholder = "Szukaj notatek...",
        },
    },
    settings = {
        title = "Ustawienia",
        description = "Zarządzaj preferencjami MDT",
        colors = "Kolory",
        color1 = "Kolor tła kontenera",
        color2 = "Kolor tła treści",
        color3 = "Kolor podstawowy",
        textColor = "Kolor tekstu bazowego",
        textColor2 = "Kolor tekstu głównego",
        borderColor = "Kolor obramowania głównego",
        resetButton = "Przywróć domyślne",
    },
    vehicle = {
        description = "Przeglądaj informacje o pojeździe",
        notes = "Powiązane notatki",
        ownersHistory = "Historia właścicieli",
        title = "Pojazd {plate}",
        changeowner = {
            success = "Poprawnie zmieniono właściciela pojazdu {plate}",
            title = "Zmiana właściciela pojazdu",
            errors = {
                cannot_sell = "Nie możesz sprzedać tego pojazdu",
                invalid_price = "Podana kwota jest nieprawidłowa",
                new_owner_offline = "Nowy właściciel jest offline",
                owner_offline = "Obecny właściciel jest offline",
                unknown_error = "Wystąpił nieznany błąd",
            },
            newowner = {
                error = "Wybierz poprawnego nowego właściciela",
                label = "Nowy właściciel",
                placeholder = "Wybierz nowego właściciela",
            },
            price = {
                error = "Podaj poprawną kwotę",
                label = "Kwota",
                placeholder = "Podaj kwotę sprzedaży",
                max_price = "Max. kwota: {max}",
                min_price = "Min. kwota: {min}"
            },
        },
        info = {
            manufactuer = "Producent",
            model = "Model",
            owner = "Właściciel",
            plate = "Tablica rejestracyjna",
            actions = {
                note = "Stwórz notatkę",
                title = "Akcje",
            },
        },
    },
    vehicles = {
        description = "Przeglądaj i wyszukuj pojazdy.",
        search = "Szukaj pojazdu...",
        title = "Pojazdy",
        filters = {
            wanted_owner = "Poszukiwany właściciel",
            wanted_vehicle = "Poszukiwany",
        },
        sort = {
            model_asc = "Model rosnąco",
            model_desc = "Model malejąco",
            owner_asc = "Właściciel rosnąco",
            owner_desc = "Właściciel malejąco",
            plate_asc = "Tablica rej. rosnąco",
            plate_desc = "Tablica rej. malejąco",
        },
    }
}
