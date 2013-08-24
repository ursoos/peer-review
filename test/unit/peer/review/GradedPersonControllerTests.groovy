package peer.review



import org.junit.*
import grails.test.mixin.*

@TestFor(GradedPersonController)
@Mock(GradedPerson)
class GradedPersonControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gradedPerson/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gradedPersonInstanceList.size() == 0
        assert model.gradedPersonInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gradedPersonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gradedPersonInstance != null
        assert view == '/gradedPerson/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gradedPerson/show/1'
        assert controller.flash.message != null
        assert GradedPerson.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gradedPerson/list'

        populateValidParams(params)
        def gradedPerson = new GradedPerson(params)

        assert gradedPerson.save() != null

        params.id = gradedPerson.id

        def model = controller.show()

        assert model.gradedPersonInstance == gradedPerson
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gradedPerson/list'

        populateValidParams(params)
        def gradedPerson = new GradedPerson(params)

        assert gradedPerson.save() != null

        params.id = gradedPerson.id

        def model = controller.edit()

        assert model.gradedPersonInstance == gradedPerson
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gradedPerson/list'

        response.reset()

        populateValidParams(params)
        def gradedPerson = new GradedPerson(params)

        assert gradedPerson.save() != null

        // test invalid parameters in update
        params.id = gradedPerson.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gradedPerson/edit"
        assert model.gradedPersonInstance != null

        gradedPerson.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gradedPerson/show/$gradedPerson.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gradedPerson.clearErrors()

        populateValidParams(params)
        params.id = gradedPerson.id
        params.version = -1
        controller.update()

        assert view == "/gradedPerson/edit"
        assert model.gradedPersonInstance != null
        assert model.gradedPersonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gradedPerson/list'

        response.reset()

        populateValidParams(params)
        def gradedPerson = new GradedPerson(params)

        assert gradedPerson.save() != null
        assert GradedPerson.count() == 1

        params.id = gradedPerson.id

        controller.delete()

        assert GradedPerson.count() == 0
        assert GradedPerson.get(gradedPerson.id) == null
        assert response.redirectedUrl == '/gradedPerson/list'
    }
}
