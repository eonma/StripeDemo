package stripe.api.playground.model;

/**
 * User: chenma
 * Date: 2019-03-04
 */

public class PersonReq extends AccountReq.Individual {

    private Relationship relationship;

    public PersonReq() {
    }

    public Relationship getRelationship() {
        return relationship;
    }

    public void setRelationship(Relationship relationship) {
        this.relationship = relationship;
    }

    public static class Relationship{
        private Boolean account_opener;
        private Boolean director;
        private Boolean owner;
        private String percent_ownership;
        private String title;

        public Relationship() {
        }

        public Boolean getAccount_opener() {
            return account_opener;
        }

        public void setAccount_opener(Boolean account_opener) {
            this.account_opener = account_opener;
        }

        public Boolean getDirector() {
            return director;
        }

        public void setDirector(Boolean director) {
            this.director = director;
        }

        public Boolean getOwner() {
            return owner;
        }

        public void setOwner(Boolean owner) {
            this.owner = owner;
        }

        public String getPercent_ownership() {
            return percent_ownership;
        }

        public void setPercent_ownership(String percent_ownership) {
            this.percent_ownership = percent_ownership;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }
    }
}
