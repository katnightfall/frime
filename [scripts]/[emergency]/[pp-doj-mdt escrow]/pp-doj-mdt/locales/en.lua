if not Locale then
    Locale = {}
end

Locale["en"] = {
    announcement = {
        description = "View announcement #{id}",
        remove = "Remove announcement",
        remove_warning_description = "Are you sure you want to remove this announcement?",
        title = "Announcement",
        edit = {
            error = "An error occurred while editing the announcement.",
            label = "Edit",
            success = "Successfully saved changes to announcement #{id}!"
        }
    },
    announcements = {
        create = "Create",
        description = "Browse and create announcements!",
        preview = "Preview",
        title = "Announcements",
        form = {
            content = {
                label = "Announcement content",
                rule = "Minimum character count is {minLength}!"
            },
            title = {
                label = "Title",
                placeholder = "Enter the announcement title...",
                rule = "The announcement title is required!"
            }
        }
    },
    citizen = {
        accounts = "Bank accounts",
        description = "View citizen profile",
        title = "Citizen",
        vehicles = "Vehicles",
        cases = {
            search = "Search by name...",
            title = "Cases"
        },
        info = {
            dob = "Date of Birth",
            dob_format = "{dob} ({dob_calculated} years old)",
            gender = "Gender",
            name = "Full Name",
            nationality = "Nationality",
            licenses = {
                title = "Licenses",
                confirm_give = "Are you sure you want to grant the {license} license to the citizen?",
                confirm_remove = "Are you sure you want to revoke the {license} license from the citizen?",
                tooltip_give = 'Grant license',
                tooltip_remove = 'Revoke license',
                notification = {
                    error = "An error occurred while managing the license!",
                    success = "Successfully updated the license!"
                },
            }
        }
    },
    citizens = {
        description = "Browse and search citizens",
        search = "Search citizen...",
        title = "Citizens",
        filters = {
            gender = "Gender",
            gender_female = "Female",
            gender_male = "Male"
        }
    },
    finances = {
        account = {
            description = "View account information.",
            title = "Account {id}",
            info = {
                balance = "Balance",
                created_at = "Created on",
                name = "Account Name",
                note = "Note",
                note_placeholder = "Enter note content...",
                number = "Account Number",
                owner = 'Account Owner',
                history = {
                    title = "History - total {total}",
                    id = "ID",
                    from = "From",
                    to = "To",
                    date = "Date",
                    amount = "Amount",
                    desc = "Title",
                    current = "Current"
                }
            }
        },
        transaction = {
            description = "View transaction information.",
            title = "Transaction #{id}",
            info = {
                amount = "Amount",
                date = "Date",
                from = "From",
                note = "Note",
                note_placeholder = "Enter note content...",
                title = "Transactions",
                to = "To",
                history = {
                    title = "History - total {total}",
                    id = "ID",
                    from = "From",
                    to = "To",
                    date = "Date",
                    amount = "Amount",
                    desc = "Title",
                    current = "Current"
                }
            }
        },
        transactions = {
            exportmodal = {
                error = "An error occurred while exporting transactions.",
                account = {
                    label = "Bank account",
                    placeholder = "Select an account to export...",
                    required = "Select an account!"
                },
                date = {
                    label = "Date range",
                    required = "Correctly fill in the start and end date"
                },
                success = {
                    description = "Transactions successfully exported! Visit the link below.",
                }
            }
        }
    },
    form = {
        title = "Document #{id}",
        print = {
            connecting = "Establishing connection...",
            error = "An error occurred while printing!",
            couldnt_connect = "Could not connect to printer",
            printingPage = "Printing... ({current}/{total})",
            title = "Printing document",
            menu = {
                title = 'Printer',
                document = 'Press to take this document',
                no_documents = {
                    title = 'No documents',
                    description = 'No printed documents'
                }
            },
            select = {
                label = "Printer",
                placeholder = "Select a printer...",
                required = "This field is required!"
            }
        }
    },
    forms = {
        description = "Browse and create documents.",
        created_at = "Created {date}",
        search = "Search documents...",
        title = "Documents",
        create = {
            title = "Create document",
            form_title = {
                min = "Required character limit is 3",
                placeholder = "Input document title...",
                required = "Title is required!",
                title = "Title",
            },
            template = {
                placeholder = "Select template",
                required = "Template is required!",
                title = "Template",
            },
        },
    },
    global = {
        attention = "Attention!",
        cancel = "Cancel",
        confirm = "Confirm",
        no = "No",
        no_perms = "No permissions!",
        no_perms_title = "You do not have permission to perform this action",
        save = "Save",
        ssn = "SSN/CitizenID",
        submit = "Submit",
        wanted = "WANTED",
        warning = "Warning",
        yes = "Yes",
        filters = {
            no_filter = "No filter",
            not_wanted = "Not wanted",
            wanted = "Wanted"
        },
        form = {
            max_error = "Maximum character count is {number}",
            min_error = "Minimum character count is {number}"
        },
        no_result = {
            title = "No results",
            subtitle = "No results found for this query"
        },
        notifications = {
            error = "Error",
            info = "Information",
            success = "Success",
            warning = "Warning"
        },
        sort = {
            ascending = "ascending",
            descending = "descending",
            name_asc = "Name ascending",
            name_desc = "Name descending",
            random = "Random",
            relevance = "Relevance"
        }
    },
    homepage = {
        description = "Welcome to the MDT homepage!",
        title = "Homepage",
        chat = {
            description = "Chat with other clerks!",
            no_messages = "No messages",
            send = "Send message...",
            title = "Chat",
            no_perms = "You do not have permission to send messages!"
        },
        clerks = {
            description = "Browse other clerks on duty!",
            title = "On-duty clerks"
        },
        profile = {
            no_result = "No profile information found!",
            subtitle = "View your profile information",
            title = "Your Profile",
            data = {
                grade = "Position:",
                session_time = "Time on duty:",
                status = "Status:",
                total_time = "Total time on duty:"
            },
        },
        search = {
            description = "Search citizens, vehicles, notes, documents, accounts, or transactions.",
            search = "Search...",
            title = "Quick Search",
            no_perms = "You do not have permission to use the search.",
            no_input = {
                title = "No query entered",
                subtitle = "Enter a phrase to start searching."
            },
            not_found = {
                title = "No results",
                subtitle = "No matching search results found."
            }
        }
    },
    management = {
        description = "Manage employees and DOJ finances",
        title = "Management",
        employees = {
            search = "Search employees...",
            changerank = {
                error = "An unknown error occurred while changing the rank.",
                success = "Rank changed successfully!",
                title = "Change Rank",
                descriptions = {
                    duty_enter = "Entered duty",
                    duty_leave = "Left duty. Total time spent: {total}",
                    promote = "Rank change, ({from} -> {to})",
                    hire = "Hired"
                },
                grade = {
                    error = "Rank is required",
                    label = "New Rank",
                    placeholder = "Enter new rank",
                },
                reason = {
                    label = "Reason",
                    placeholder = "Enter reason",
                },
            },
            employee = {
                changerank = "Change Rank",
                fire = "Fire",
                history = "History",
                manage = "Manage",
                status = "Status",
                offline = "Offline",
                online = "Online",
                session_duty = "Session Duty Time",
                total_duty = "Total Duty Time",
                hired_at = "Hired On",
                last_promoted = "Last Promoted"
            },
            fire = {
                error = "An error occurred while firing the employee.",
                success = "Employee fired successfully",
                title = "Fire Employee",
                reason = {
                    error = "Provide a reason",
                    label = "Reason",
                },
            },
            hire = {
                success = "Employee hired successfully!",
                title = "Hire Employee",
                citizen = {
                    label = "Citizen",
                    placeholder = "Select a person to hire",
                },
                errors = {
                    default = "An error occurred while hiring the employee",
                    offline = "The citizen is offline!",
                    self = "You cannot hire yourself!",
                },
            },
            history = {
                date = "Date",
                description = "Description",
                id = "ID",
            },
        },
        finances = {
            deposit = "Deposit",
            withdraw = "Withdraw",
            balance = "Balance",
            form = {
                error = "An error occurred. Try again",
                amount = {
                    label = "Amount",
                    placeholder = "Enter amount...",
                    required = "Enter a valid amount!"
                },
                message = {
                    label = "Title",
                    placeholder = "Enter transaction title..."
                }
            },
            transaction = {
                amount = "Amount",
                author = "Author",
                date = "Date",
                details = "ADDITIONAL INFORMATION",
                id = "ID",
                message = "Transaction title",
                type = "Type"
            },
            transactions = {
                search = "Search transactions..."
            }
        }
    },
    navigation = {
        homepage = "Homepage",
        announcements = "Announcements",
        citizens = "Citizens",
        vehicles = "Vehicles",
        notes = "Notes",
        forms = "Documents",
        finances = "Finances",
        settings = "Settings",
        management = "Management",
        exit = "Exit"
    },
    settings = {
        title = "Settings",
        description = "Manage MDT preferences",
        colors = "Colors",
        color1 = "Container background color",
        color2 = "Content background color",
        color3 = "Primary color",
        textColor = "Base text color",
        textColor2 = "Main text color",
        borderColor = "Main border color",
        resetButton = "Reset to default",
    },
    vehicle = {
        description = "Browse vehicle information",
        notes = "Related notes",
        ownersHistory = "Ownership history",
        title = "Vehicle {plate}",
        changeowner = {
            success = "Successfully changed vehicle owner {plate}",
            title = "Change vehicle owner",
            errors = {
                cannot_sell = "You cannot sell this vehicle",
                invalid_price = "The specified price is invalid",
                new_owner_offline = "The new owner is offline",
                owner_offline = "The current owner is offline",
                unknown_error = "An unknown error occurred",
            },
            newowner = {
                error = "Select a valid new owner",
                label = "New owner",
                placeholder = "Select a new owner",
            },
            price = {
                error = "Enter a valid amount",
                label = "Amount",
                placeholder = "Enter the sale price",
                max_price = "Max price: {max}",
                min_price = "Min price: {min}"
            },
        },
        info = {
            manufactuer = "Manufacturer",
            model = "Model",
            owner = "Owner",
            plate = "License plate",
            actions = {
                note = "Create a note",
                title = "Actions",
            },
        },
    },
    vehicles = {
        description = "Browse and search for vehicles.",
        search = "Search for a vehicle...",
        title = "Vehicles",
        filters = {
            wanted_owner = "Wanted owner",
            wanted_vehicle = "Wanted",
        },
        sort = {
            model_asc = "Model ascending",
            model_desc = "Model descending",
            owner_asc = "Owner ascending",
            owner_desc = "Owner descending",
            plate_asc = "License plate ascending",
            plate_desc = "License plate descending",
        },
    }
}
