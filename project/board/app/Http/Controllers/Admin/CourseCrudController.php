<?php

namespace App\Http\Controllers\Admin;

use App\Http\Helper;
use App\Http\Requests\CourseRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class CourseCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class CourseCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\BulkDeleteOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\Course::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/groups');
        CRUD::setEntityNameStrings('Группу', 'Группы');

        if (backpack_user()->hasRole('user')) {
            CRUD::denyAccess(['update', 'create', 'delete']);
        }
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        CRUD::column('title')->label('Название');
        CRUD::column('start_at')->label('Старт');
        CRUD::column('end_at')->label('Конец');
        CRUD::column('status')->label('Статус');
        CRUD::column('user_id')->label('Организатор');


        /**
         * Columns can be defined using the fluent syntax or array syntax:
         * - CRUD::column('price')->type('number');
         * - CRUD::addColumn(['name' => 'price', 'type' => 'number']);
         */
    }

    protected function helperCreateOperation()
    {
        CRUD::setValidation(CourseRequest::class);

        CRUD::field('title')->label('Название');
        CRUD::field('desc')->label('Описание')->type('ckeditor');
        CRUD::field('start_at')->type('datetime_picker')->label('Старт');
        CRUD::field('end_at')->type('datetime_picker')->label('Конец');
        CRUD::field('status')->label('Статус');
    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {
        $this->helperCreateOperation();

        if( backpack_user()->hasRole('admin') ) {
            CRUD::field('user_id')->label('Организатор');

            $this->crud->addField([
                'name' => 'pupils',
                'type' => 'select2_multiple',
                'label' => 'Участники'
            ]);
        } else {
            $this->crud->addField([
                'name'        => 'pupils',
                'label'       => "Участники",
                'type'        => 'select2_from_array',
                'options'     => Helper::getMyPupils(),
                'allows_multiple' => true, // OPTIONAL; needs you to cast this to array in your model;
            ]);
        }


        /**
         * Fields can be defined using the fluent syntax or array syntax:
         * - CRUD::field('price')->type('number');
         * - CRUD::addField(['name' => 'price', 'type' => 'number']));
         */
    }

    /**
     * Define what happens when the Update operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->helperCreateOperation();

        if( backpack_user()->hasRole('admin') ) {
            CRUD::field('user_id')->label('Организатор');

            $this->crud->addField([
                'name' => 'pupils',
                'type' => 'select2_multiple',
                'label' => 'Участники'
            ]);
        } else {
            $this->crud->addField([
                'name'        => 'pupils',
                'label'       => "Участники",
                'type'        => 'select2_from_array',
                'options'     => Helper::getMyPupils(),
                'allows_multiple' => true, // OPTIONAL; needs you to cast this to array in your model;
                'value' => $this->crud->getCurrentEntry()->pupils()->pluck('id')->toArray()
            ]);
        }
    }
}
