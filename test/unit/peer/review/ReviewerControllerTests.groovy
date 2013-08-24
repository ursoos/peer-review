package peer.review



import org.junit.*
import grails.test.mixin.*

@TestFor(ReviewerController)
@Mock(Reviewer)
class ReviewerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reviewer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reviewerInstanceList.size() == 0
        assert model.reviewerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reviewerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reviewerInstance != null
        assert view == '/reviewer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reviewer/show/1'
        assert controller.flash.message != null
        assert Reviewer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reviewer/list'

        populateValidParams(params)
        def reviewer = new Reviewer(params)

        assert reviewer.save() != null

        params.id = reviewer.id

        def model = controller.show()

        assert model.reviewerInstance == reviewer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reviewer/list'

        populateValidParams(params)
        def reviewer = new Reviewer(params)

        assert reviewer.save() != null

        params.id = reviewer.id

        def model = controller.edit()

        assert model.reviewerInstance == reviewer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reviewer/list'

        response.reset()

        populateValidParams(params)
        def reviewer = new Reviewer(params)

        assert reviewer.save() != null

        // test invalid parameters in update
        params.id = reviewer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reviewer/edit"
        assert model.reviewerInstance != null

        reviewer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reviewer/show/$reviewer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reviewer.clearErrors()

        populateValidParams(params)
        params.id = reviewer.id
        params.version = -1
        controller.update()

        assert view == "/reviewer/edit"
        assert model.reviewerInstance != null
        assert model.reviewerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reviewer/list'

        response.reset()

        populateValidParams(params)
        def reviewer = new Reviewer(params)

        assert reviewer.save() != null
        assert Reviewer.count() == 1

        params.id = reviewer.id

        controller.delete()

        assert Reviewer.count() == 0
        assert Reviewer.get(reviewer.id) == null
        assert response.redirectedUrl == '/reviewer/list'
    }
}
