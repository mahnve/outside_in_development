!SLIDE bullets

# Why automatic testing?

* Make sure it works now
* Make sure it works whenever

!SLIDE bullets

# Why TDD?

* Make sure it works now
* Make sure it works whenever
* Know when you're done

!SLIDE code

# Method Testing

    @@@ Ruby
    class Klazz
      def method
        do_something
      end
    end
    
    class KlazzTest
      def setup
        @klazz = Klazz.new
      end
      def test_method
        result = @klazz.do_something
        assert_equal("expected", result)
      end
    end

!SLIDE code

# The Context Problem

    @@@ Ruby
    
    class KlazzTest
      def setup
        @klazz = Klazz.new
      end
      def test_method
        result = @klazz.do_something
        assert_equal(:expected, result)
      end
      def test_another_context
        klazz = Klazz.new(:constructor_args)
        assert_equal(:expected_2, klazz.do_something)
      end
    end

!SLIDE bullets

# Why BDD?

* Make sure it works now
* Make sure it works whenever
* Know when you're done
* Build just what's needed
* Design from functionality
* Documentation - why

!SLIDE bullets

# What is BDD?

> "BDD is TDD done right"

> "TDD means 'write the test first'. BDD takes this idea to a more general
> level: 'write the client first' (the outside)"   
> - Aslak Hellesøy
  
!SLIDE center

# The BDD Flow

![BDD Flow](bdd_flow.svg)
