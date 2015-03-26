angular.module 'custom.components', ['builder']

.config ['$builderProvider', ($builderProvider) ->
    # ----------------------------------------
    # text input
    # ----------------------------------------
    $builderProvider.registerComponent 'textInput',
        index: 0
        group: 'Default'
        label: 'Text Input'
        description: 'description'
        placeholder: 'placeholder'
        required: no
        validations: {
            regex: ''
            minLength: ''
            maxLength: ''
        }
        validationOptions: [ 'none', 'number', 'text', 'alphanumeric' ]
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="text-input-icon">Text Input</i>
              <figcaption class="form-builder-option-title">
                <h5>Text Input</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <input type="text" ng-model="inputText" name="asset[metadata][{{id}}]" id="{{id}}" class="form-control" ng-model-options="{ debounce : { 'default' : 500, blur : 0 } }" placeholder="{{placeholder}}"/>
              <p class='help-block'>{{description}}</p>
              <p class='validation-block'>{{validationString}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Description</label>
                    <input type='text' ng-model="description" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Placeholder</label>
                    <input type='text' ng-model="placeholder" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <div ng-if="validationOptions.length > 0">
                        <label>Validation</label>
                        <select ng-model="validations.regex" ng-options="option for option in validationOptions"></select>
                    </div>
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Minimum Length</label>
                    <input type='text' ng-model="validations.minLength" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Maximum Length</label>
                    <input type='text' ng-model="validations.maxLength" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <div class="checkbox">
                        <label>
                            <input type='checkbox' ng-model="required" />
                            Required
                        </label>
                    </div>
                </fieldset>
                <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # Text area
    # ----------------------------------------
    $builderProvider.registerComponent 'textArea',
        index: 0
        group: 'Default'
        label: 'Text Area'
        description: 'description'
        placeholder: 'placeholder'
        required: no
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="textarea-icon">Text Input</i>
              <figcaption class="form-builder-option-title">
                <h5>Textarea</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <textarea type="text" ng-model="inputText" name="asset[metadata][{{id}}]" id="{{id}}" class="form-control" rows='6' placeholder="{{placeholder}}"/>
              <p class='help-block'>{{description}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label class='control-label' ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" class='form-control'/>
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Description</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Placeholder</label>
                    <input type='text' ng-model="placeholder" class='form-control'/>
                </fieldset>
                <fieldset class="checkbox form-fieldset">
                    <label>
                        <input type='checkbox' ng-model="required" />
                        Required</label>
                </fieldset>
                 <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # checkbox
    # ----------------------------------------
    $builderProvider.registerComponent 'checkbox',
        index: 0
        group: 'Default'
        label: 'Checkbox'
        description: 'description'
        placeholder: 'placeholder'
        required: no
        options: ['value one', 'value two']
        validations: {
            checkbox: 'checkbox'
        }
        arrayToText: yes
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="checkbox-icon">Checkbox</i>
              <figcaption class="form-builder-option-title">
                <h5>Checkboxes</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <input type='hidden' ng-model="inputText" name="asset[metadata][{{id}}]" id="{{id}}" value="{{inputText}}"/>
              <div class='checkbox checkbox-group' ng-repeat="item in options track by $index">
                <label>
                    <input type='checkbox' ng-model="$parent.inputArray[$index]" value='item'/>
                    {{item}}
                </label>
              </div>
              <p class='help-block'>{{description}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label class='control-label' ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Description</label>
                    <input type='text' ng-model="description" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Options</label>
                    <textarea rows="3" ng-model="optionsText"/>
                </fieldset>
                <fieldset class="checkbox form-fieldset">
                    <label class="checkbox-group">
                        <input type='checkbox' ng-model="required" />
                        Required
                    </label>
                </fieldset>
                <fieldset class='form-fieldset form-actions'>
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # radio
    # ----------------------------------------
    $builderProvider.registerComponent 'radio',
        index: 0
        group: 'Default'
        label: 'Radio'
        description: 'description'
        placeholder: 'placeholder'
        required: no
        options: ['value one', 'value two']
        validations: {
            radio: 'radio'
        }
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="radio-button-icon">Radio Button</i>
              <figcaption class="form-builder-option-title">
                <h5>Radio Buttons</h5>
              </figcaption>
            </figure>
            """
        template:
            """
           <div class="form-element">
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
                <div class='radio' ng-repeat="item in options track by $index">
                  <label><input ng-model="$parent.inputText" name="asset[metadata][{{id}}]" id="{{id}}" value='{{item}}' type='radio'/>
                          {{item}}
                  </label>
                 </div>
                <p class='help-block'>{{description}}</p>
             </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label class='control-label' ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" class='form-control'/>
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Description</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Options</label>
                    <textarea class="form-control" rows="3" ng-model="optionsText"/>
                </fieldset>
                <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # select
    # ----------------------------------------
    $builderProvider.registerComponent 'select',
        index: 0
        group: 'Default'
        label: 'Select'
        description: 'description'
        placeholder: 'placeholder'
        required: no
        options: ['value one', 'value two']
        validations: {
            select: 'select'
        }
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="select-icon">Select Input</i>
              <figcaption class="form-builder-option-title">
                <h5>Select Input</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <select ng-options="value for value in options track by value" id="{{id}}"
                ng-model="inputText" name="asset[metadata][{{id}}]" ng-init="inputText = options[0]"/>
              <p class='help-block'>{{description}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label class='control-label' ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" class='form-control'/>
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Description</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </fieldset>
                <fieldset class="form-fieldset">
                    <label class='control-label'>Options</label>
                    <textarea class="form-control" rows="3" ng-model="optionsText"/>
                </fieldset>
                <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # number input
    # ----------------------------------------
    $builderProvider.registerComponent 'numberInput',
        index: 0
        group: 'Default'
        label: 'Number Input'
        description: 'description'
        placeholder: 'placeholder'
        required: no
        validations: {
            regex: 'number'
        }
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="text-input-icon">Number Input</i>
              <figcaption class="form-builder-option-title">
                <h5>Number Input</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <input type="text" ng-model="inputText" name="asset[metadata][{{id}}]" id="{{id}}" class="form-control" placeholder="{{placeholder}}"/>
              <p class='help-block'>{{description}}</p>
              <p class='validation-block'>{{validationString}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Description</label>
                    <input type='text' ng-model="description" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Placeholder</label>
                    <input type='text' ng-model="placeholder" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <div class="checkbox">
                        <label>
                            <input type='checkbox' ng-model="required" />
                            Required
                        </label>
                    </div>
                </fieldset>
                <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # date input
    # ----------------------------------------
    $builderProvider.registerComponent 'dateInput',
        index: 0
        group: 'Default'
        label: 'Date Input'
        description: 'description'
        placeholder: 'm/dd/yyyy'
        required: no
        validations: {
            regex: 'date'
        }
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="text-input-icon">Date Input</i>
              <figcaption class="form-builder-option-title">
                <h5>Date Input</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <input type="text" ng-model="inputText" name="asset[metadata][{{id}}]" id="{{id}}" class="form-control" placeholder="{{placeholder}}"/>
              <p class='help-block'>{{description}}</p>
              <p class='validation-block'>{{validationString}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Description</label>
                    <input type='text' ng-model="description" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <div class="checkbox">
                        <label>
                            <input type='checkbox' ng-model="required" />
                            Required
                        </label>
                    </div>
                </fieldset>
                <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # datetime input
    # ----------------------------------------
    $builderProvider.registerComponent 'dateTimeInput',
        index: 0
        group: 'Default'
        label: 'DateTime Input'
        description: 'description'
        placeholder: 'm/dd/yyyy h:mm:ss am/pm'
        required: no
        validations: {
            regex: 'datetime'
        }
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="text-input-icon">DateTime Input</i>
              <figcaption class="form-builder-option-title">
                <h5>DateTime Input</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <input type="text" ng-model="inputText" name="asset[metadata][{{id}}]" id="{{id}}" class="form-control" placeholder="{{placeholder}}"/>
              <p class='help-block'>{{description}}</p>
              <p class='validation-block'>{{validationString}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Description</label>
                    <input type='text' ng-model="description" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <div class="checkbox">
                        <label>
                            <input type='checkbox' ng-model="required" />
                            Required
                        </label>
                    </div>
                </fieldset>
                <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """

    # ----------------------------------------
    # time input
    # ----------------------------------------
    $builderProvider.registerComponent 'timeInput',
        index: 0
        group: 'Default'
        label: 'Time Input'
        description: 'description'
        placeholder: 'h:mm:ss am/pm'
        required: no
        validations: {
            regex: 'time'
        }
        thumbnail:
            """
            <figure class="form-builder-option">
              <i class="text-input-icon">Time Input</i>
              <figcaption class="form-builder-option-title">
                <h5>Time Input</h5>
              </figcaption>
            </figure>
            """
        template:
            """
            <div class="well">
            <div class="form-element">
              <a class="pull-right" remove-form-component index="index" form-name="formName">
                <i class="fa fa-times-circle text-danger"></i>
              </a>
              <label for="{{formName+index}}" class="control-label" ng-class="{required: required}">{{label}}</label>
              <input type="text" ng-model="inputText" name="asset[metadata][{{id}}]" id="{{id}}" class="form-control" placeholder="{{placeholder}}"/>
              <p class='help-block'>{{description}}</p>
              <p class='validation-block'>{{validationString}}</p>
            </div>
            </div>
            """
        popoverTemplate:
            """
            <span ng-click="popover.cancel($event)" class='popover-close'>X</span>
            <form>
                <fieldset class="form-fieldset">
                    <label ng-class="{required: required}">Label</label>
                    <input type='text' ng-model="label" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <label>Description</label>
                    <input type='text' ng-model="description" />
                </fieldset>
                <fieldset class="form-fieldset">
                    <div class="checkbox">
                        <label>
                            <input type='checkbox' ng-model="required" />
                            Required
                        </label>
                    </div>
                </fieldset>
                <fieldset class="form-fieldset form-actions">
                    <input type='submit' ng-click="popover.save($event)" class='button button-primary' value='Save'/>
                </fieldset>
            </form>
            """
]
