!SLIDE code

# Java

    @@@ Java

    package cukes;

    import cuke4duke.annotation.I18n.EN.Given;

    public class BlogPostSteps {

        @Given("^I write a blog post with title \\"([^\\"]*)\\" and body \\"([^\\"]*)\\"$")
        public void writeBlogPost (String title, String body) {

          ...

        }
    }


!SLIDE code 

# Groovy

    @@@ Groovy

    this.metaClass.mixin(cuke4duke.GroovyDsl)

    Given(~/^I write a blog post with title "([^"]*)" and body "([^"]*)"$/) { String title, String body ->
      ...
    }
