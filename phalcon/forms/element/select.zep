
/*
 +------------------------------------------------------------------------+
 | Phalcon Framework                                                      |
 +------------------------------------------------------------------------+
 | Copyright (c) 2011-2017 Phalcon Team (https://phalconphp.com)          |
 +------------------------------------------------------------------------+
 | This source file is subject to the New BSD License that is bundled     |
 | with this package in the file LICENSE.txt.                             |
 |                                                                        |
 | If you did not receive a copy of the license and are unable to         |
 | obtain it through the world-wide-web, please send an email             |
 | to license@phalconphp.com so we can send you a copy immediately.       |
 +------------------------------------------------------------------------+
 | Authors: Andres Gutierrez <andres@phalconphp.com>                      |
 |          Eduar Carvajal <eduar@phalconphp.com>                         |
 +------------------------------------------------------------------------+
 */

namespace Phalcon\Forms\Element;

use Phalcon\Tag\Select;
use Phalcon\Forms\Element;

/**
 * Phalcon\Forms\Element\Select
 *
 * Component SELECT (choice) for forms
 */
class Select extends Element
{

	protected _optionsValues;

	/**
	 * Phalcon\Forms\Element constructor
	 *
	 * @param string name
	 * @param object|array options
	 * @param array attributes
	 */
	public function __construct(string name, options = null, attributes = null)
	{
		let this->_optionsValues = options;
		parent::__construct(name, attributes);
	}

	/**
	 * Set the choice's options
	 *
	 * @param array|object options
	 * @return \Phalcon\Forms\Element
	 */
	public function setOptions(var options) -> <Element>
	{
		let this->_optionsValues = options;
		return this;
	}

	/**
	 * Returns the choices' options
	 *
	 * @return array|object
	 */
	public function getOptions()
	{
		return this->_optionsValues;
	}

	/**
	 * Adds an option to the current options
	 *
	 * @param array option
	 * @return this
	 */
	public function addOption(var option) -> <Element>
	{
		var key, value;

		if typeof option == "array" {
			for key, value in option {
				let this->_optionsValues[key] = value;
			}
		} else {
			let this->_optionsValues[] = option;
		}

		return this;
	}

	/**
	 * Renders the element widget returning html
	 *
	 * @param array attributes
	 */
	public function render(attributes = null) -> string
	{
		/**
		 * Merged passed attributes with previously defined ones
		 */
		return Select::selectField(this->prepareAttributes(attributes), this->_optionsValues);
	}
}
