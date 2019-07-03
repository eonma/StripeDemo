package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-02-11
 */

public class AccountReq {

    private String type;
    private String country;
    private String email;
    private String account_token;
    private BusinessProfile business_profile;
    private String business_type;
    private String default_currency;
    private ExternalAccount external_account;
    private Company company;
    private Individual individual;
    private Settings settings;
    private TosAcceptance tos_acceptance;

    public AccountReq() {
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAccount_token() {
        return account_token;
    }

    public void setAccount_token(String account_token) {
        this.account_token = account_token;
    }

    public BusinessProfile getBusiness_profile() {
        return business_profile;
    }

    public void setBusiness_profile(BusinessProfile business_profile) {
        this.business_profile = business_profile;
    }

    public String getBusiness_type() {
        return business_type;
    }

    public void setBusiness_type(String business_type) {
        this.business_type = business_type;
    }

    public String getDefault_currency() {
        return default_currency;
    }

    public void setDefault_currency(String default_currency) {
        this.default_currency = default_currency;
    }

    public ExternalAccount getExternal_account() {
        return external_account;
    }

    public void setExternal_account(ExternalAccount external_account) {
        this.external_account = external_account;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Individual getIndividual() {
        return individual;
    }

    public void setIndividual(Individual individual) {
        this.individual = individual;
    }

    public Settings getSettings() {
        return settings;
    }

    public void setSettings(Settings settings) {
        this.settings = settings;
    }

    public TosAcceptance getTos_acceptance() {
        return tos_acceptance;
    }

    public void setTos_acceptance(TosAcceptance tos_acceptance) {
        this.tos_acceptance = tos_acceptance;
    }

    public static class BusinessProfile{
        private String mcc;
        private String name;
        private String product_description;
        private String support_email;
        private String support_phone;
        private String support_url;
        private String url;

        public BusinessProfile() {
        }

        public String getMcc() {
            return mcc;
        }

        public void setMcc(String mcc) {
            this.mcc = mcc;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getProduct_description() {
            return product_description;
        }

        public void setProduct_description(String product_description) {
            this.product_description = product_description;
        }

        public String getSupport_email() {
            return support_email;
        }

        public void setSupport_email(String support_email) {
            this.support_email = support_email;
        }

        public String getSupport_phone() {
            return support_phone;
        }

        public void setSupport_phone(String support_phone) {
            this.support_phone = support_phone;
        }

        public String getSupport_url() {
            return support_url;
        }

        public void setSupport_url(String support_url) {
            this.support_url = support_url;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }

    public static class Company{
        private Address address;
        private Boolean directors_provided;
        private String name;
        private Boolean owners_provided;
        private String phone;
        private String tax_id;
        private String vat_id;

        public Company() {
        }

        public Address getAddress() {
            return address;
        }

        public void setAddress(Address address) {
            this.address = address;
        }

        public Boolean getDirectors_provided() {
            return directors_provided;
        }

        public void setDirectors_provided(Boolean directors_provided) {
            this.directors_provided = directors_provided;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Boolean getOwners_provided() {
            return owners_provided;
        }

        public void setOwners_provided(Boolean owners_provided) {
            this.owners_provided = owners_provided;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getTax_id() {
            return tax_id;
        }

        public void setTax_id(String tax_id) {
            this.tax_id = tax_id;
        }

        public String getVat_id() {
            return vat_id;
        }

        public void setVat_id(String vat_id) {
            this.vat_id = vat_id;
        }
    }

    public static class Individual{
        private Address address;
        private DOB dob;
        private String email;
        private String first_name;
        private String gender;
        private String id_number;
        private String last_name;
        private String phone;
        private String ssn_last_4;
        private Verification verification;

        public Individual() {
        }

        public static class DOB{
            private String day;
            private String month;
            private String year;

            public DOB() {
            }

            public String getDay() {
                return day;
            }

            public void setDay(String day) {
                this.day = day;
            }

            public String getMonth() {
                return month;
            }

            public void setMonth(String month) {
                this.month = month;
            }

            public String getYear() {
                return year;
            }

            public void setYear(String year) {
                this.year = year;
            }
        }

        public static class Verification{

            private Document document;

            public Verification() {
            }

            public Document getDocument() {
                return document;
            }

            public void setDocument(Document document) {
                this.document = document;
            }

            private static class Document{
                private String back;
                private String front;

                public Document() {
                }

                public String getBack() {
                    return back;
                }

                public void setBack(String back) {
                    this.back = back;
                }

                public String getFront() {
                    return front;
                }

                public void setFront(String front) {
                    this.front = front;
                }
            }
        }

        public Address getAddress() {
            return address;
        }

        public void setAddress(Address address) {
            this.address = address;
        }

        public DOB getDob() {
            return dob;
        }

        public void setDob(DOB dob) {
            this.dob = dob;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getFirst_name() {
            return first_name;
        }

        public void setFirst_name(String first_name) {
            this.first_name = first_name;
        }

        public String getGender() {
            return gender;
        }

        public void setGender(String gender) {
            this.gender = gender;
        }

        public String getId_number() {
            return id_number;
        }

        public void setId_number(String id_number) {
            this.id_number = id_number;
        }

        public String getLast_name() {
            return last_name;
        }

        public void setLast_name(String last_name) {
            this.last_name = last_name;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getSsn_last_4() {
            return ssn_last_4;
        }

        public void setSsn_last_4(String ssn_last_4) {
            this.ssn_last_4 = ssn_last_4;
        }

        public Verification getVerification() {
            return verification;
        }

        public void setVerification(Verification verification) {
            this.verification = verification;
        }
    }

    public static class ExternalAccount{
        private String object;
        private String country;
        private String currency;
        private String account_holder_name;
        private String account_holder_type;
        private String account_number;
        private String routing_number;

        public ExternalAccount(){

        }

        public String getObject() {
            return object;
        }

        public void setObject(String object) {
            this.object = object;
        }

        public String getCountry() {
            return country;
        }

        public void setCountry(String country) {
            this.country = country;
        }

        public String getCurrency() {
            return currency;
        }

        public void setCurrency(String currency) {
            this.currency = currency;
        }

        public String getAccount_holder_name() {
            return account_holder_name;
        }

        public void setAccount_holder_name(String account_holder_name) {
            this.account_holder_name = account_holder_name;
        }

        public String getAccount_holder_type() {
            return account_holder_type;
        }

        public void setAccount_holder_type(String account_holder_type) {
            this.account_holder_type = account_holder_type;
        }

        public String getAccount_number() {
            return account_number;
        }

        public void setAccount_number(String account_number) {
            this.account_number = account_number;
        }

        public String getRouting_number() {
            return routing_number;
        }

        public void setRouting_number(String routing_number) {
            this.routing_number = routing_number;
        }
    }

    public static class Settings{

        private Branding branding;
        private CardPayments card_payments;
        private Payments payments;
        private Payouts payouts;

        public Settings() {
        }

        public Branding getBranding() {
            return branding;
        }

        public void setBranding(Branding branding) {
            this.branding = branding;
        }

        public CardPayments getCard_payments() {
            return card_payments;
        }

        public void setCard_payments(CardPayments card_payments) {
            this.card_payments = card_payments;
        }

        public Payments getPayments() {
            return payments;
        }

        public void setPayments(Payments payments) {
            this.payments = payments;
        }

        public Payouts getPayouts() {
            return payouts;
        }

        public void setPayouts(Payouts payouts) {
            this.payouts = payouts;
        }

        public static class Branding{
            private String icon;
            private String logo;
            private String primary_color;

            public Branding() {
            }

            public String getIcon() {
                return icon;
            }

            public void setIcon(String icon) {
                this.icon = icon;
            }

            public String getLogo() {
                return logo;
            }

            public void setLogo(String logo) {
                this.logo = logo;
            }

            public String getPrimary_color() {
                return primary_color;
            }

            public void setPrimary_color(String primary_color) {
                this.primary_color = primary_color;
            }
        }

        public static class CardPayments{
            private DeclineOn decline_on;
            private String statement_descriptor_prefix;

            public CardPayments() {
            }

            public DeclineOn getDecline_on() {
                return decline_on;
            }

            public void setDecline_on(DeclineOn decline_on) {
                this.decline_on = decline_on;
            }

            public String getStatement_descriptor_prefix() {
                return statement_descriptor_prefix;
            }

            public void setStatement_descriptor_prefix(String statement_descriptor_prefix) {
                this.statement_descriptor_prefix = statement_descriptor_prefix;
            }

            public static class DeclineOn{
                private Boolean avs_failure;
                private Boolean cvc_failure;

                public DeclineOn() {
                }

                public Boolean getAvs_failure() {
                    return avs_failure;
                }

                public void setAvs_failure(Boolean avs_failure) {
                    this.avs_failure = avs_failure;
                }

                public Boolean getCvc_failure() {
                    return cvc_failure;
                }

                public void setCvc_failure(Boolean cvc_failure) {
                    this.cvc_failure = cvc_failure;
                }
            }

        }

        public static class Payments{

            private String statement_descriptor;

            public Payments() {
            }

            public String getStatement_descriptor() {
                return statement_descriptor;
            }

            public void setStatement_descriptor(String statement_descriptor) {
                this.statement_descriptor = statement_descriptor;
            }
        }

        public static class Payouts{

            private Boolean debit_negative_balances;
            private Schedule schedule;
            private String statement_descriptor;

            public Payouts() {
            }

            public Boolean getDebit_negative_balances() {
                return debit_negative_balances;
            }

            public void setDebit_negative_balances(Boolean debit_negative_balances) {
                this.debit_negative_balances = debit_negative_balances;
            }

            public Schedule getSchedule() {
                return schedule;
            }

            public void setSchedule(Schedule schedule) {
                this.schedule = schedule;
            }

            public String getStatement_descriptor() {
                return statement_descriptor;
            }

            public void setStatement_descriptor(String statement_descriptor) {
                this.statement_descriptor = statement_descriptor;
            }

            public static class Schedule{

                private String delay_days;
                private String interval;
                private String monthly_anchor;
                private String weekly_anchor;

                public Schedule() {
                }

                public String getDelay_days() {
                    return delay_days;
                }

                public void setDelay_days(String delay_days) {
                    this.delay_days = delay_days;
                }

                public String getInterval() {
                    return interval;
                }

                public void setInterval(String interval) {
                    this.interval = interval;
                }

                public String getMonthly_anchor() {
                    return monthly_anchor;
                }

                public void setMonthly_anchor(String monthly_anchor) {
                    this.monthly_anchor = monthly_anchor;
                }

                public String getWeekly_anchor() {
                    return weekly_anchor;
                }

                public void setWeekly_anchor(String weekly_anchor) {
                    this.weekly_anchor = weekly_anchor;
                }
            }
        }

    }

    public static class TosAcceptance{
        private int date;
        private String ip;

        public TosAcceptance() {
        }

        public int getDate() {
            return date;
        }

        public void setDate(int date) {
            this.date = date;
        }

        public String getIp() {
            return ip;
        }

        public void setIp(String ip) {
            this.ip = ip;
        }
    }

    /**
     * Returns a JSON string corresponding to object state
     *
     * @return JSON representation
     */
    public String toJSON() {
        return JSONFormatter.toJSON(this);
    }
}
