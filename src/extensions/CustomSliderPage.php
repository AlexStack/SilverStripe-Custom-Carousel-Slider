<?php

namespace SSCustomCarouselSlider\Extensions;

use SSCustomCarouselSlider\Model\CustomSliderImage;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\GridField\GridField;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;


class CustomSliderPage extends DataExtension
{

    private static $db = [

        'SliderBuiltInTemplate' => 'Varchar',
        'SliderCustomTemplate'  => 'Varchar',
        'SliderDisplayPlace'    => 'Varchar'
        
    ];


    private static $has_many = [
        'CustomSliderImages' => CustomSliderImage::class
    ];


    private static $defaults = [

        'SliderBuiltInTemplate' => '',
        'SliderCustomTemplate'  => '',
        'SliderDisplayPlace'    => 'BeforeContent'
    ];

    public function updateCMSFields(FieldList $fields)
    {
        if($this->owner->SliderBuiltInTemplate != '' && $this->owner->SliderBuiltInTemplate != 'disabled') {
            $carousel_table = GridField::create(
                'CustomSliderImages',
                false,
                $this->owner->CustomSliderImages(),
                GridFieldConfig_RecordEditor::create()
                    ->addComponent(new GridFieldOrderableRows('Sort'))
            );

            $fields->addFieldToTab('Root.CarouselSlider', $carousel_table);
        } else {
            $fields->removeByName('CustomSliderImages');
        }

        parent::updateCMSFields($fields);
    }

    public function updateSettingsFields(FieldList $fields)
    {
        $message = '<p>Enable a Carousel Slider for this page? </p>';
        
        $fields->addFieldToTab(
            'Root.Settings',
            LiteralField::create("CarouselMessage", $message)
        );


        $fields->addFieldsToTab(
            'Root.Settings',
            [

                new DropdownField('SliderBuiltInTemplate', 'Choose a Built-In Slider', [
                    '' => 'Enable a Carousel Slider for this page?',
                    'BootstrapSlider001' => 'Bootstrap 4.x Carousel Slider',
                    'SlickSlider001' => 'Slick Carousel Fade In',
                    'FlexSlider001' => 'Flex Slider with Simple Caption',
                    'BxSlider001' => 'Bx Slider with Simple Caption',
                    'LightSlider001' => 'LightSlider without Caption',
                    'OwlCarousel001' => 'OwlCarousel2 without Caption',
                    'CustomTemplate' => 'Use my own slider template below'
                ]),                    
                TextField::create(
                    'SliderCustomTemplate',
                    $this->owner->fieldLabel('My slider template')
                ),
                new DropdownField('SliderDisplayPlace', 'Display Slider Where', [
                    'BeforeContent' => 'Display the Slider before main content',
                    'AfterContent' => 'Display the Slider after main content',
                    'CustomPlace' => 'Manually insert $showCustomerSlider to my template'
                ]),                 
            ]
        );

    }

    /**
     * override $Content
     *
     * @return DBField $Content for backend String $Content for frontend
     */
    public function Content()   {
        $isFrontend = false;
        if ( $this->owner->URLSegment && strlen($this->owner->URLSegment) > 2 ) {
            $isFrontend = true;
        }
        if ( isset($_SERVER['REQUEST_URI']) && strpos($_SERVER['REQUEST_URI'], '/admin/') !== false ) {
            $isFrontend = false;
        }
        if ( $isFrontend ) {
            if ( $this->owner->SliderDisplayPlace == 'BeforeContent'){
                return $this->showCustomerSlider()  . $this->owner->Content;
            } else if ( $this->owner->SliderDisplayPlace == 'AfterContent'){
                return $this->owner->Content . $this->showCustomerSlider();
            } 
        }
        return $this->owner->Content;
    }


    public function showCustomerSlider() {

        if ( $this->owner->SliderBuiltInTemplate == ''){
            return '<!-- Custom Carousel Slider not enabled -->';
        }

        $template = ( $this->owner->SliderBuiltInTemplate == 'CustomTemplate' && trim($this->owner->SliderCustomTemplate) != '' ) 
        ? 
        'Includes/' . trim(str_replace('.ss','',$this->owner->SliderCustomTemplate))
        : 
        "SSCustomCarouselSlider/" . $this->owner->SliderBuiltInTemplate;


        return $this
            ->owner
            ->renderWith(
                $template,
                [
                    'CustomSliderImages' => $this->owner->CustomSliderImages(),
                ]
            );
    }
}
